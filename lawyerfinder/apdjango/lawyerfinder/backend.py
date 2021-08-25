from django.contrib.auth.backends import ModelBackend
from .models import * 

import logging

logger = logging.getLogger('elearning portal')

class CustomUserAuthBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            logger.warning(">>>>>>>>>>>> hahahaha")
            user = CustomUser.objects.get(username=username)
            logger.warning("<USER> ", user)
            # user = User.objects.get(username=username)
            if user.check_password(password):
                return user
        except ObjectDoesNotExist:
            # Run the default password hasher once to reduce the timing
            # difference between an existing and a non-existing user (#20760).
            CustomUser().set_password(password)