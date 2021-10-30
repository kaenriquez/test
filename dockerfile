FROM ubuntu:18.10


RUN apt-get update && apt-get -y install apache2
EXPOSE 80
