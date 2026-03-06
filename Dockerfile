# Use official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev git && \
    rm -rf /var/lib/apt/lists/*

# Install pipenv (optional) or use pip
RUN pip install --upgrade pip

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Collect static files (if using staticfiles)
RUN python manage.py collectstatic --noinput

# Apply migrations
RUN python manage.py migrate

# Expose port
EXPOSE 8000

# Run the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
