#!/bin/bash

# Running Database migrations
# python manage.py migrate --noinput
chown -R 1000:1000 "/root/.npm"
python manage.py collectstatic --noinput --clear
python manage.py tailwind install
python manage.py tailwind build



# Running Application with uWSGI
exec gunicorn personal_site.wsgi:application \
    --bind=0.0.0.0:9090 \
    # --log-level=info \
    # --access-logfile=$PWD/accesslog.log \
    --workers=4 \
    # --error-logfile=$PWD/errorlog.log \