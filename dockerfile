FROM registry.access.redhat.com/ubi8-minimal

ENV KEYCLOAK_VERSION 16.1.0
ENV JDBC_POSTGRES_VERSION 42.2.5
ENV JDBC_MYSQL_VERSION 8.0.22
ENV JDBC_MARIADB_VERSION 2.5.4
ENV JDBC_MSSQL_VERSION 8.2.2.jre11

ENV PROXY_ADDRESS_FORWARDING=true
ENV KEYCLOAK_USER=admin 
ENV KEYCLOAK_PASSWORD=admin
ENV DB_VENDOR=MYSQL
ENV DB_ADDR=192.168.179.129
ENV DB_PORT=3306
ENV DB_DATABASE=keycloak
ENV DB_USER=keycloak 
ENV DB_PASSWORD=@Keycloak15653
ENV LAUNCH_JBOSS_IN_BACKGROUND 1
ENV JBOSS_HOME /opt/jboss/keycloak
ENV LANG en_US.UTF-8


RUN mkdir -p home/kath/opt/jboss
RUN microdnf update -y && microdnf install -y glibc-langpack-en gzip hostname java-11-openjdk-headless openssl tar which && microdnf clean all




RUN chmod 777 docker-entrypoint.sh

EXPOSE 8080	
EXPOSE 8443


ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]
