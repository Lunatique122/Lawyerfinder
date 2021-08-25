from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import permissions, status, viewsets
from lawyerfinder import serializers
from rest_framework.views import APIView

from rest_framework.response import Response

from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import authenticate
from lawyerfinder.models import CustomUser
from rest_framework_jwt.settings import api_settings
from rest_framework_jwt.views import ObtainJSONWebToken
from django.conf import settings
from django.contrib.auth.hashers import make_password

import logging

jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER
jwt_decode_handler = api_settings.JWT_DECODE_HANDLER

logger = logging.getLogger('elearning portal')

class LoginView(ObtainJSONWebToken):
    def post(self, request, *args, **kwargs):
        # @authentication_classes([])
        permission_classes = []
        serializer_class = serializers.CustomUserSerializer
        # by default attempts username / passsword combination
        response = super(LoginView, self).post(request, *args, **kwargs)
        # token = response.data['token']  # don't use this to prevent errors
        # below will return null, but not an error, if not found :)
        res = response.data
        token = res.get('token')

        # else:  # if none, try auth by email
        req = request.data  # try and find email in request
        #email = req.get('email')
        password = str(req.get('password'))
        username = str(req.get('username'))
        logger.warning("<USERNAME> ", username)
        logger.warning("<PWD> ", password)
        # sign_on_name = req.get('sign_on_name')

        user = authenticate(username=username, password=password)
        # logger.warning("<USER> ", user)
        if user is not None:
            payload = jwt_payload_handler(user)

            # if created:
            token = jwt_encode_handler(payload)
            bpus = serializers.CustomUserSerializer()
            user = bpus.serialize([ user, ])
            # user = UserSerializer(user,
            #                 context=self.get_serializer_context()).data
            return Response({'success': True,
                            'message': 'Successfully logged in',
                            'token': token,
                            'user': user},
                            status=200)
        return Response({'success': False, 
                        'message': 'Missing or incorrect credentials',
                        'data': req},
                        status=403)