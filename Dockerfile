FROM jboss/wildfly:latest

ENV PWD_ROOT 1234

COPY default.sdg /opt/jboss/wildfly/sdg/configuration/default.sdg
COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/standalone.xml
COPY org /opt/jboss/wildfly/modules/org/
RUN /opt/jboss/wildfly/bin/add-user.sh admin $PWD_ROOT --silent

EXPOSE 8090
EXPOSE 8443
EXPOSE 9990
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
