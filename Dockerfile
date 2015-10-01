FROM ubuntu:14.04
MAINTAINER Swarco Traffic Systems <alex.lizenberg@swarco.de>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list && \
    apt-get update && \
    apt-get install -y pwgen mongodb-org mongodb-org-server mongodb-org-shell mongodb-org-mongos mongodb-org-tools && \
    echo "mongodb-org hold" | dpkg --set-selections && echo "mongodb-org-server hold" | dpkg --set-selections && \
    echo "mongodb-org-shell hold" | dpkg --set-selections && \
    echo "mongodb-org-mongos hold" | dpkg --set-selections && \
    echo "mongodb-org-tools hold" | dpkg --set-selections

VOLUME /data/lib

ENV AUTH yes
ENV STORAGE_ENGINE wiredTiger
ENV JOURNALING yes

RUN mkdir -p /data/db && chown -R mongodb:mongodb /data/db
VOLUME /data/db


COPY run.sh /run.sh
COPY set_mongodb_password.sh ./set_mongodb_password.sh
RUN chown 755 /run.sh

EXPOSE 27017
CMD ["/run.sh"]
