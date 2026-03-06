FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# system dependencies
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev git && \
    rm -rf /var/lib/apt/lists/*

# upgrade pip
RUN pip install --upgrade pip

# install python dependencies
RUN pip install \
    Django \
    django-helpdesk \
    django-allauth \
    django-user-accounts \
    pinax-invitations \
    pinax-notifications \
    django-forms-bootstrap \
    django-bootstrap-form \
    django-filter \
    markdown \
    bleach \
    pillow \
    psycopg2-binary \
    gunicorn

# copy project
COPY . /app

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
