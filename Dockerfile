FROM jboss/wildfly:latest

ENV PWD_ROOT 1234
RUN apt-get update && apt-get -y install wget

RUN wget http://sue19:8080/jenkins/job/SDG_Broker_devel_ocit_merge/ws/sdg/com.swarco.sdg.parent/com.swarco.sdg.application/target/com.swarco.sdg.application-0.0.1-SNAPSHOT.ear && \
    mkdir /opt/jboss/wildfly/standalone/deplyments && \
    cp com.swarco.sdg.application-0.0.1-SNAPSHOT.ear /opt/jboss/wildfly/standalone/deplyments && \
    rm -rf com.swarco.sdg.application-0.0.1-SNAPSHOT.ear
    
COPY default.sdg /opt/jboss/wildfly/sdg/configuration/default.sdg
COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/standalone.xml
COPY org /opt/jboss/wildfly/modules/org/
RUN /opt/jboss/wildfly/bin/add-user.sh admin $PWD_ROOT --silent


EXPOSE 8090
EXPOSE 8443
EXPOSE 9990
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
