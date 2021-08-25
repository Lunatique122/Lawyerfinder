# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
import os

from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser
)

class CustomUserManager(BaseUserManager):
    def create_user(self, first_name, last_name, username, email, is_teacher, is_learner, password=None):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        # """
        # if not is_teacher:
        #     raise ValueError('Users must have a is_teacher')

        user = self.model(
            first_name=first_name,
            last_name=last_name,
            username=username,
            email=email,
            is_teacher=is_teacher,
            is_learner=is_learner,
            is_active=False,
        )

        # user.is_superuser = False
        user.is_admin = False
        # user.is_active = True
        # user.is_teacher = is_teacher
        # user.is_learner = is_learner
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, first_name, last_name, username, email, is_teacher, is_learner, password=None):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        # user = self.create_user(
        #     email,
        #     password=password,
        #     date_of_birth=date_of_birth,
        # )
        user = self.create_user(
            first_name,
            last_name,
            username,
            email,
            is_teacher,
            is_learner,
            password,
        )
        # user.is_superuser = True
        user.is_admin = True
        # user.is_active = True
        # user.is_teacher = False 
        # user.is_learner = False
        user.save(using=self._db)
        return user



#def get_course_img_upload_path(course, filename):
    #return os.path.join(
    #"courses/%s/" % course.course_id, "images/", filename)



# class Courses(models.Model):
#     course_id = models.AutoField(primary_key=True)
#     is_active = models.BooleanField(default=False, blank=False, null=False)
#     title = models.CharField(max_length=50)
#     image = models.ImageField(upload_to=get_course_img_upload_path, blank=False, null=False)
#     video = models.FileField(upload_to=get_course_video_upload_path, blank=False, null=False)
#     category = models.CharField(max_length=20, blank=False, null=False)
#     subcategory = models.CharField(max_length=20, blank=False, null=False)
#     user_count = models.BigIntegerField()
#     teacher = models.ForeignKey('CustomUser', models.DO_NOTHING)
#     language = models.CharField(max_length=2)
#     cost = models.IntegerField()
#     long_desc = models.CharField(max_length=300)
#     short_desc = models.CharField(max_length=100)
#     target_audience = models.CharField(max_length=30)
#     goal = models.CharField(max_length=200)
#     rating = models.IntegerField(blank=True, null=True)
#     duration = models.IntegerField(blank=True, null=True)
#     # creation_date = models.TextField(blank=False, null=False)
#     creation_date = models.TextField()
#     update_date = models.CharField(max_length=19, blank=True, null=True)
#
#     class Meta:
#         managed = False
#         db_table = 'courses'
#
#     # Model Save override
#     def save(self, *args, **kwargs):
#         if self.course_id is None:
#             saved_image = self.image
#             self.image = None
#             saved_video = self.video
#             self.video = None
#             super(Courses, self).save(*args, **kwargs)
#             self.image = saved_image
#             self.video = saved_video
#             if 'force_insert' in kwargs:
#                 kwargs.pop('force_insert')
#
#         super(Courses, self).save(*args, **kwargs)


class CustomUser(AbstractBaseUser):
    user_id = models.AutoField(primary_key=True)
    is_active = models.BooleanField(default=False, blank=False, null=False)
    is_teacher = models.BooleanField(default=False, blank=False, null=False)
    is_learner = models.BooleanField(default=False, blank=False, null=False)
    is_admin = models.BooleanField(default=False, blank=False, null=False)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    occupation = models.CharField(max_length=50, blank=True, null=True)
    biography = models.CharField(max_length=150, blank=True, null=True)
    website = models.CharField(max_length=30, blank=True, null=True)
    linkedin = models.CharField(max_length=30, blank=True, null=True)
    youtube = models.CharField(max_length=30, blank=True, null=True)
    researchgate = models.CharField(max_length=30, blank=True, null=True)
    twitter = models.CharField(max_length=30, blank=True, null=True)
    facebook = models.CharField(max_length=30, blank=True, null=True)
    email = models.CharField(max_length=30, blank=True, null=True)
    username = models.CharField(max_length=30, blank=True, null=False, unique=True)
    password = models.CharField(max_length=100)
    country = models.CharField(max_length=2, blank=True, null=True)
    photo = models.CharField(max_length=30, blank=True, null=True)
    creation_date = models.TextField(blank=True, null=True)
    last_login = models.CharField(max_length=32, blank=True, null=True)

    objects = CustomUserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['first_name', 'last_name', 'email', 'is_teacher', 'is_learner']

    # class Meta:
    #     app_label = 'swiftapp.CustomUser'

    class Meta:
        managed = False
        db_table='users'

    def __str__(self):
        return self.username

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    # @property
    # def is_admin(self):
    #     "Is the user a member of staff?"
    #     # Simplest possible answer: All admins are staff
    #     return self.is_admin

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin

    # @property
    # def is_teacher(self):
    #     return self.is_teacher

    # @property
    # def is_learner(self):
    #     return self.is_learner

class Lawyers(models.Model):
    lawyer = models.CharField(primary_key=True, max_length=200)
    field = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    city = models.CharField(max_length=200)
    phone = models.IntegerField()
    score = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'lawyers'