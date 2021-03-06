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
from .auth import *
from .views import *
from rest_framework.decorators import authentication_classes
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token
# from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

urlpatterns = [
    path('', admin.site.urls),
    path(r'', include('lawyerfinder.urls')),
    path('api/auth/login', LoginView.as_view(), name='login'),
    path('api/auth/token/refresh', refresh_jwt_token),
]
