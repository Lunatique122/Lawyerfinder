from django.shortcuts import render
from rest_framework import viewsets, permissions
from rest_framework import status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.conf import settings
import datetime
from django.core.mail import BadHeaderError, send_mail
from django.http import HttpResponse, HttpResponseRedirect, HttpResponseNotFound
# import base64
from django.http import JsonResponse
from rest_framework.authtoken.models import Token

from lawyerfinder.models import CustomUser
from lawyerfinder import serializers, admin
from lawyerfinder.serializers import RegisterSerializer
from lawyerfinder.permissions import ReadOnly
from rest_framework_jwt import authentication

from django.contrib.auth.decorators import login_required
# from django.contrib.auth.mixins import UserPassesTestMixin
import logging

from rest_framework.decorators import api_view, authentication_classes, permission_classes
import os.path
# from fpdf import FPDF
from django.http.response import FileResponse, Http404
from rest_framework.decorators import api_view, renderer_classes
from rest_framework.renderers import JSONRenderer, TemplateHTMLRenderer
from django.shortcuts import get_object_or_404

from datetime import datetime
# import django_filters.rest_framework
from rest_framework.filters import SearchFilter
from rest_framework.decorators import action

logger = logging.getLogger('lawyerfinder')

# @api_view(('POST',))
# @renderer_classes((JSONRenderer,))
# def signup_user(request):
class UserModelViewSet(viewsets.ModelViewSet):
    # get_queryset = CustomUser.objects.all()
    serializer_class = RegisterSerializer

    def post(self, request, *args, **kwargs):
        #TODO password confirmation
        # permission_classes = [AllowAny]
        # authentication_classes = []
        serializer_class = RegisterSerializer

        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')
        logger.warning("password1 ", password1)
        logger.warning("password2 ", password2)
        if password1 and password2 and password1 != password2:
            # raise forms.ValidationError("Passwords don't match")
            return HttpResponse(status=400)
        password = password1
        user = CustomUser.objects.create(username=username,
                                        first_name=first_name,
                                        last_name=last_name,
                                        email=email,
                                        is_teacher=is_teacher,
                                        is_learner=is_learner,
                                        password=make_password(password),
                                        )
        if user:
            return Response({
                "user": UserSerializer(user,
                context=self.get_serializer_context()).data
            })
        return Response

    # @action(methods=['post'], detail=False, permission_classes=[])
    # def post(self, request, *args, **kwargs):
    #     #TODO password confirmation
    #     # permission_classes = [AllowAny]
    #     # authentication_classes = []
    #     serializer_class = RegisterSerializer

    #     password1 = request.POST.get('password1')
    #     password2 = request.POST.get('password2')
    #     logger.warning("password1 ", password1)
    #     logger.warning("password2 ", password2)
    #     if password1 and password2 and password1 != password2:
    #         # raise forms.ValidationError("Passwords don't match")
    #         return HttpResponse(status=400)
    #     request.data.password = password1
    #     serializer = self.get_serializer(data=request.data)
    #     serializer.is_valid(raise_exception=True)
    #     user = serializer.save()
    #     if user:
    #         return Response({
    #             "user": UserSerializer(user,
    #             context=self.get_serializer_context()).data
    #         })
    #     return Response

    def put(self, request, *args, **kwargs):
        # kwargs['partial'] = True
        # return super().update(request, *args, **kwargs)
        post_data = request.data
        user_id = post_data.get("user_id")
        if user_id != "" and user_id is not None:
            updated_transfer = CustomUser.objects.filter(user_id=post_data.get("user_id"))\
                                            .update(
                                                # modified_at=now.strftime("%Y-%m-%d %H:%M:%S"),
                                                first_name=post_data.get("first_name"),
                                                last_name=post_data.get("last_name"),
                                            )
            if updated_transfer:
                return Response({
                    "success": True,
                })
        return Response({
            "status": False
        })

    def delete(self,request, *args, **kwargs):
        user_id = self.kwargs["user_id"]
        logger.warning("userid to delete: ", user_id)
        user = get_object_or_404(CustomUser, user_id=user_id)
        user.delete()
        return Response(status=204)

    # def destroy(self, request, *args, **kwargs):
    #     try:
    #         instance = self.get_object()
    #         self.perform_destroy(instance)
    #     except Http404:
    #         pass
    #     return Response(status=status.HTTP_204_NO_CONTENT)

    # def put(self, request, *args, **kwargs):
    #     partial = True # Here I change partial to True
    #     instance = self.get_object()
    #     serializer = self.get_serializer(instance, data=request.data, partial=partial)
    #     serializer.is_valid(raise_exception=True)
    #     self.perform_update(serializer)

    #     return Response(serializer.data)

    # class UserListView(generics.ListAPIView):
    def get_queryset(self):
        serializer_class = serializers.CustomUserSerializer
        # filter_backends = [django_filters.rest_framework.DjangoFilterBackend]
        # filter_backends = [SearchFilter]
        queryset = CustomUser.objects.all()
        data = self.request.GET
        username = data.get('username')
        first_name = data.get('firstName')
        last_name = data.get('lastName')
        start_date = data.get('start_date')
        end_date = data.get('end_date')
        username_sort = data.get('username_sort')
        first_name_sort = data.get('first_name_sort')
        last_name_sort = data.get('last_name_sort')
        creation_date_sort = data.get('creation_date_sort')

        if username:
            queryset = queryset.filter(username__contains=username)
        if first_name:
            queryset = queryset.filter(first_name__contains=first_name)
        if last_name:
            queryset = queryset.filter(last_name__contains=last_name)
        if start_date:
            queryset = queryset.filter(creation_date__gte=start_date)
        if end_date:
            queryset = queryset.filter(creation_date__lte=end_date)
    
        if username_sort:
            queryset = queryset.order_by(username=username_sort)
        if first_name_sort:
            queryset = queryset.order_by(first_name=first_name_sort)
        if username_sort:
            queryset = queryset.order_by(username=username_sort)
        if creation_date_sort:
            queryset = queryset.order_by(creation_date=creation_date_sort)

        return list(queryset.order_by('-creation_date'))
        # if request.method == 'POST':
            # form = admin.UserCreationForm(request.POST)
            # if form.is_valid():
            #     form.save()
            #     username = form.cleaned_data.get('username')
            #     raw_password = form.cleaned_data.get('password1')
            #     user = authenticate(username=username, password=raw_password)
            #     login(request, user)
            #     return HttpResponse(status=200)
            # return HttpResponse(status=400)
                # return redirect('home')

            # username = request.POST.get('username', None)
            # first_name = request.POST.get('first_name', None)
            # last_name = request.POST.get('last_name', None)
            # is_teacher = request.POST.get('is_teacher', None)
            # is_learner = request.POST.get('is_learner', None)
            # password1 = request.POST.get('password1', None)
            # password2 = request.POST.get('password2', None)
            # logger.warning("username> ", username)
            # if password1 and password2 and password1 != password2:
            #     raise forms.ValidationError("Passwords don't match")
            # user = CustomUser.objects.create_user(username=username,
            #                                       first_name=first_name,
            #                                       last_name=last_name,
            #                                       is_teacher=is_teacher,
            #                                       is_learner=is_learner)
            # user.set_password(password1)
            # user.save()