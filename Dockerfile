FROM jboss/wildfly:latest

COPY org $JBOSS_HOME/modules/org/
