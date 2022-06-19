#!/bin/bash

set -x

docker container rm workstation_tmp
docker image rm workstation_tmp:initial
docker image rm workstation_tmp:initial
docker image rm workstation_tmp:initial
docker image rm workstation_tmp:vim

docker container rm workstation
docker image rm workstation_tmp:latest
