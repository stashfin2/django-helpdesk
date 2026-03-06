# FROM python:3.11-slim

# ENV PYTHONDONTWRITEBYTECODE=1
# ENV PYTHONUNBUFFERED=1

# WORKDIR /app

# # system deps
# RUN apt-get update && \
#     apt-get install -y build-essential libpq-dev git && \
#     rm -rf /var/lib/apt/lists/*

# # upgrade pip
# RUN pip install --upgrade pip

# # install python dependencies required by django-helpdesk projects
# RUN pip install \
#     Django \
#     django-helpdesk \
#     django-allauth \
#     psycopg2-binary \
#     gunicorn \
#     django-user-accounts

# # copy project
# COPY . /app

# # expose port
# EXPOSE 8000

# # start server
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# system deps
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev git && \
    rm -rf /var/lib/apt/lists/*

# upgrade pip
RUN pip install --upgrade pip

# install dependencies
RUN pip install \
    Django \
    django-helpdesk \
    django-allauth \
    django-user-accounts \
    pinax-notifications \
    django-forms-bootstrap \
    markdown \
    bleach \
    psycopg2-binary \
    gunicorn

# copy project
COPY . /app

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
