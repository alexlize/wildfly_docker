FROM jboss/wildfly:latest


COPY default.sdg /opt/jboss/wildfly/sdg/configuration/default.sdg
COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/standalone.xml
COPY org /opt/jboss/wildfly/modules/org/
RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin#007 --silent

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
