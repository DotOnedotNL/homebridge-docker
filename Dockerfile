FROM debian:stretch
#FROM nodesource/jessie
#FROM nodesource/jessie:5.8.0
MAINTAINER Andre Vink <andre@dotone.nl>

##################################################
# Set environment variables                      #
##################################################

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

##################################################
# Install tools                                  #
##################################################

RUN apt-get update
RUN apt-get install -y apt-utils 
RUN apt-get install -y apt-transport-https
RUN apt-get install -y locales
RUN apt-get install -y curl wget git python build-essential make g++ libavahi-compat-libdnssd-dev libkrb5-dev vim net-tools nano

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs

RUN alias ll='ls -alG'

##################################################
# Install homebridge                             #
##################################################

RUN npm install -g homebridge --unsafe-perm

# depending on your config.json you have to add your modules here!
#RUN npm install -g homebridge-philipshue --unsafe-perm
#RUN npm install -g homebridge-ninjablock-temperature --unsafe-perm
#RUN npm install -g homebridge-ninjablock-humidity --unsafe-perm
#RUN npm install -g homebridge-ninjablock-alarmstatedevice --unsafe-perm
#RUN npm install -g homebridge-luxtronik2 --unsafe-perm
RUN npm install -g homebridge-people --unsafe-perm
#RUN npm install -g homebridge-tesla --unsafe-perm
RUN npm install -g homebridge-mqttswitch --unsafe-perm
RUN npm install -g homebridge-edomoticz --unsafe-perm

##################################################
# Start                                          #
##################################################

USER root
RUN mkdir -p /var/run/dbus

ADD image/run.sh /root/run.sh

EXPOSE 5353 51826
CMD ["/root/run.sh"]
