FROM ubuntu


RUN apt-get update && apt-get -y install apache2
EXPOSE 80
