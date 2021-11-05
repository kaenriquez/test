FROM ubuntu:latest
 
#
# Identify the maintainer of an image
LABEL maintainer="myname@somecompany.com"
 
#
# Update the image to the latest packages
#RUN apt-get update && apt-get upgrade -y
 
#
# Install NGINX to test.
RUN apt-get install -y apache2 && apt-get clean

RUN apt-get install apache2 -y
 
#
# Expose port 80
EXPOSE 80
 
CMD service apache2 start
# Last is the actual command to start up NGINX within our Container
#CMD ["apache2", "-g", "daemon off;"]
