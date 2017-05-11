#FROM debian:stretch
FROM nodesource/jessie
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

# Install Node.js - required for debian:stretch
# RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
# RUN apt-get install -y nodejs

RUN alias ll='ls -alG'

##################################################
# Install homebridge                             #
##################################################

RUN npm install -g homebridge --unsafe-perm

# Disable avahi to run on eth0.
# there is an avahi daemon on this interface already
# we created a macvlan interface for this container

RUN sed -i 's/#deny-interfaces=eth1/deny-interfaces=eth0/' /etc/avahi/avahi-daemon.conf


# depending on your config.json you have to add your modules here!
RUN npm install -g homebridge-people --unsafe-perm
RUN npm install -g homebridge-mqtt --unsafe-perm
RUN npm install -g homebridge-mqttswitch --unsafe-perm
RUN npm install -g homebridge-edomoticz --unsafe-perm
RUN npm install -g homebridge-hue --unsafe-perm

##################################################
# Start                                          #
##################################################

USER root
RUN mkdir -p /var/run/dbus

ADD image/run.sh /root/run.sh

EXPOSE 5353 51826
CMD ["/root/run.sh"]
