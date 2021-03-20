# Use an official Python runtime as a parent image
FROM python:3.9-buster

# Set the working directory to /code
RUN mkdir -p /code
WORKDIR /code
ADD . /code

# Add The repo for the MS SQL ODBC driver
# https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver15#debian17
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Install dependencies
RUN apt-get update
RUN apt-get install build-essential
RUN apt-get install -y unixodbc-dev
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17

# Install any needed packages specified in requirements.txt
RUN python3 -m pip install -r requirements.txt

# Run app.py when the container launches
# CMD ["python", "App.py"]
