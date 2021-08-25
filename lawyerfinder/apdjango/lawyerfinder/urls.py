"""djangomail URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from lawyerfinder.views import users
from rest_framework import routers

#from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

router = routers.DefaultRouter(trailing_slash=False)

# router.register(r'elearning/courses', courses.CoursesViewSet, basename='get_queryset')
router.register(r'elearning/users$', users.UserModelViewSet, basename='user')
router.register(r'elearning/users/(?P<id>[0-9]+)$', users.UserModelViewSet, basename='user')
#router.register(r'elearning/courses$', courses.CourseModelViewSet, basename='course')
#router.register(r'elearning/courses/(?P<id>[0-9]+)$', courses.CourseModelViewSet, basename='course')


urlpatterns = [
    path(r'api/', include(router.urls)),
    # path('api/user/signup', users.signup_user, name='signup_user'),
    # path('api/elearning/courses/send_to_ctaf', send_courses_to_ctaf, name='send_courses_to_ctaf'),
    # path('api/auth/login', send_courses_to_ctaf.as_view(), name='send_courses_to_ctaf'),
    # path('api/elearning/count/courses', courses.CourseCountView.as_view()),
    # path('api/elearning/dates/courses', courses.CourseDateView.as_view()),
    # path('api/elearning/recent_activity/courses', courses.CourseRecentActivityView.as_view()),
    # path('api/elearning/send_courses_to_ctaf', courses.send_courses_to_ctaf, name='send_courses_to_ctaf'),
    # path('api/elearning/update_courset', courses.update_courset, name='update_courset'),
]