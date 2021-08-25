import logging

from apscheduler.schedulers.background import BackgroundScheduler
# from apscheduler.schedulers.blocking import BlockingScheduler
# from apscheduler.executors.pool import ProcessPoolExecutor, ThreadPoolExecutor
from django_apscheduler.jobstores import register_events, register_job
from apdjango import settings
# from datetime import timedelta
from datetime import *
import calendar
from django.db import connections
# from dateutil.relativedelta import *

from lawyerfinder.data_generation import transfers_from_t24_to_db, versements_from_t24_to_db, cessions_bbe_from_t24_to_db, autorisations_sortie_from_t24_to_db

logger = logging.getLogger('hannibal_ctaf')

# def add_one_month(orig_date):
#     # advance year and month by one month
#     new_year = orig_date.year
#     new_month = orig_date.month + 1
#     # note: in datetime.date, months go from 1 to 12
#     if new_month > 12:
#         new_year += 1
#         new_month -= 12

#     last_day_of_month = calendar.monthrange(new_year, new_month)[1]
#     new_day = min(orig_date.day, last_day_of_month)

#     return orig_date.replace(year=new_year, month=new_month, day=new_day)

def load_transfers(start_date, end_date):
    # logger.warning("transfers_from_t24_to_db job call")
    logger.warning("start_date ", start_date)
    logger.warning("end_date ", end_date)
    # transfers_from_t24_to_db.main(connections['hannibal_ctaf'], start_date, end_date)
    transfers_from_t24_to_db.main(start_date, end_date)

def load_versements(start_date, end_date):
    logger.warning("start_date ", start_date)
    logger.warning("end_date ", end_date)
    versements_from_t24_to_db.main(start_date, end_date)

def load_cessions_bbe(start_date, end_date):
    logger.warning("start_date ", start_date)
    logger.warning("end_date ", end_date)
    cessions_bbe_from_t24_to_db.main(start_date, end_date)

def load_autorisations_sortie(start_date, end_date):
    logger.warning("start_date ", start_date)
    logger.warning("end_date ", end_date)
    autorisations_sortie_from_t24_to_db.main(start_date, end_date)
    
def start():
    if settings.DEBUG:
        # Hook into the apscheduler logger
        logging.basicConfig()
        logging.getLogger('hannibal_ctaf').setLevel(logging.DEBUG)
    
    # Create scheduler to run in a thread inside the application process
    scheduler = BackgroundScheduler(settings.SCHEDULER_CONFIG)

    # scheduler = BackgroundScheduler()
    

    # Adding this job here instead of to crons.
    # This will do the following:
    # - Add a scheduled job to the job store on application initialization
    # - The job will execute a model class method at midnight each day
    # - replace_existing in combination with the unique ID prevents duplicate copies of the job
    # Periodes d'extraction chaque jour:
    # - de 18:45 a 11:45
    # - de 11:45 a 18:45
    # datetime object containing current date and time
    start_date = datetime.now()
    # end_date = add_one_month(start_date)
    start_date = start_date.strftime("%Y%m%d")
    end_date = start_date
    scheduler.add_job(load_transfers, "cron", args=[start_date, end_date], id="load_transfers_1", hour=16, minute=33, replace_existing=True)
    # scheduler.add_job(load_transfers, "cron", args=[start_date, end_date], id="load_transfers_2", hour=18, minute=14, replace_existing=True)

    scheduler.add_job(load_versements, "cron", args=[start_date, end_date], id="load_versements_1", hour=16, minute=33, replace_existing=True)
    # scheduler.add_job(load_versements, "cron", args=[start_date, end_date], id="load_versements_2", hour=18, minute=14, replace_existing=True)

    scheduler.add_job(load_cessions_bbe, "cron", args=[start_date, end_date], id="load_cessions_bbe_1", hour=16, minute=33, replace_existing=True)
    # scheduler.add_job(load_cessions_bbe, "cron", args=[start_date, end_date], id="load_cessions_bbe_2", hour=18, minute=14, replace_existing=True)

    scheduler.add_job(load_autorisations_sortie, "cron", args=[start_date, end_date], id="load_autorisations_sortie_1", hour=16, minute=33, replace_existing=True)
    # scheduler.add_job(load_autorisations_sortie, "cron", args=[start_date, end_date], id="load_autorisations_sortie_2", hour=18, minute=14, replace_existing=True)
    
    # scheduler.add_job(hello, 'interval', seconds=3, id='my_job_id')

    # Add the scheduled jobs to the Django admin interface
    register_events(scheduler)

    scheduler.start()