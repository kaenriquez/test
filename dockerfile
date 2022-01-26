FROM ubuntu:latest

ENV PROXY_ADDRESS_FORWARDING=true
ENV KEYCLOAK_USER=admin \
    KEYCLOAK_PASSWORD=admin
ENV DB_VENDOR=MYSQL
ENV DB_ADDR=10.217.1.19
    DB_PORT=3309
ENV DB_DATABASE=keycloak
ENV DB_USER=uat_keycloak \
    DB_PASSWORD=@15653keycloak

ADD host=HOST:10.217.129.23
ADD tools /opt/jboss/tools
	
RUN mkdir -p /home/kath

EXPOSE 8080	
EXPOSE 8443

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]


