# Homebridge-Docker

Docker image for Homebrigde
This project only builds a docker image, please do not report problems with homebridge but look into the homebridge project: For details see https://github.com/nfarina/homebridge

As said, this is simply wrapping the source in a runnable Docker image for everyone that cannot install the dev environment on his machine or everyone that wants a simple containerized solution.

## Supported plugins
homebridge-philipshue
homebridge-ninjablock-temperature
homebridge-ninjablock-humidity
homebridge-ninjablock-alarmstatedevice
homebridge-luxtronik2
homebridge-mqttswitch
homebridge-edomoticz
homebridge-synology
homebridge-tesla

(and you can extend this list by adding more plugins in the file package.json)

## Configuration

Copy `config-sample.json` to `config.json` and adapt to your likings.

## Build

`./homebridge.sh build`

## Run

### run first time

`./homebridge.sh run`

### stop

`./homebridge.sh stop`

### start

(after stopping)

`./homebridge.sh start`

### remove

(needed before run is possible again)

`./homebridge.sh remove`

### rerun

Stops and removes the containers, then performs run again

`./homebridge.sh rerun`

### attach

Attaches to the running container

`./homebridge.sh attach`

### logs

Diplays stdout log of the running container

`./homebridge.sh logs`

## Changelog
###0.1
Initial release of homebridge-docker
###0.11
moved from nodesource/jessie:5.8.0 to xxx
updated versions
