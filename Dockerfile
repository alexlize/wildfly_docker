FROM jboss/wildfly:latest

COPY default.sdg $JBOSS_HOME/sdg/configuration/default.sdg
COPY standalone.xml $JBOSS_HOME/standalone/configuration/standalone.xml
COPY org $JBOSS_HOME/modules/org/
