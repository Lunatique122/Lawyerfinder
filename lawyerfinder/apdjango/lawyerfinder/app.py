from django.apps import AppConfig
from django.conf import settings
import logging

logger = logging.getLogger('elearningapp')

class AppConfig(AppConfig):
    name = 'lawyerfinder'
    # def ready(self):
        # from . import scheduler
        # if settings.SCHEDULER_AUTOSTART:
        #     scheduler.start()