FROM ubuntu:18.10
LABEL maintainer="egidio.docile@linuxconfig.org"

RUN apt-get update && apt-get -y install apache2
EXPOSE 80
