FROM registry.access.redhat.com/ubi8-minimal

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



RUN mkdir -p /home/kath
ADD tools /opt/jboss/tools
RUN /opt/jboss/tools/build-keycloak.sh
EXPOSE 8080	
EXPOSE 8443


ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]
