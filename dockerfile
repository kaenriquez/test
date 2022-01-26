FROM ubuntu:latest

ENV PROXY_ADDRESS_FORWARDING=true
ENV KEYCLOAK_USER=admin \
    KEYCLOAK_PASSWORD=admin
ENV DB_VENDOR=MYSQL
ENV DB_ADDR=192.168.179.129
    DB_PORT=3306
ENV DB_DATABASE=keycloak
ENV DB_USER=keycloak \
    DB_PASSWORD=@Keycloak15653

ADD host=HOST:192.168.179.159
ADD tools /opt/jboss/tools
	
RUN mkdir -p /home/kath

EXPOSE 8080	
EXPOSE 8443

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]


