# Use Ubuntu 18.04 as the base image
FROM ubuntu:18.04

# Specify your e-mail address as the maintainer of the container image
MAINTAINER Your Name "ronsong@pdx.edu"

# Execute apt-get update and install to get Python's package manager
#  installed (pip)
RUN apt-get update -y
RUN apt-get install -y python-pip

# Copy the contents of the current directory into the container directory /app
COPY . /app

# Set the working directory of the container to /app
WORKDIR /app

# Install the Python packages specified by requirements.txt into the container
RUN pip install -r requirements.txt
RUN export GOOGLE_APPLICATION_CREDENTIALS=myrecipemlapis.json

# Set the program that is invoked upon container instantiation
ENTRYPOINT ["python"]

# Set the parameters to the program
CMD ["app.py"]