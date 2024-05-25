# Use an official Python runtime as a parent image
FROM python:3.12

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Copy the requirements file into the container
COPY requirements.txt requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /srv/www/mysite
COPY . .


# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV PYTHONUNBUFFERED=1

# Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "myapp.wsgi:application"]


# Install Gunicorn
RUN pip install gunicorn

# Start Gunicorn with our application
CMD ["gunicorn", "-c", "gunicorn_config.py", "mysite.wsgi:application"]

