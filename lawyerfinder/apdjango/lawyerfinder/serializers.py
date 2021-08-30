from rest_framework import serializers
from .models import CustomUser
from django.core.serializers.python import Serializer

class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        #   fields = ('id', 'username', 'first_name', 'last_name', 'email', 'password')
        fields = ('__all__')
        extra_kwargs = {'password' : {'write_only': True}}
    def create(self, validated_data):
        user = CustomUser.objects.create_user(validated_data['first_name'],
                                        validated_data['last_name'],
                                        validated_data['username'],
                                        validated_data['email'],
                                        # validated_data['is_superuser'],
                                        # validated_data['is_admin'],
                                        # validated_data[''],
                                        # validated_data['is_learner'],
                                        validated_data['password']
        )
        return user

class CustomUserSerializer(Serializer):
 
    class Meta:
        model = CustomUser
        # fields = ('id', 'branch', 'username', 'first_name', 'last_name')
        fields = ('__all__')
        # exclude = ('password',)
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
            first_name = validated_data.pop('first_name')
            last_name = validated_data.pop('last_name')
            # password = validated_data.pop('password')
            # password = validated_data.pop('password')
            # password = validated_data.pop('password')
            password = validated_data.pop('password')
            user = CustomUser(**validated_data)
            user.set_password(password)
            user.save()
            return user


