#!/bin/bash
# reset_all.sh

docker stop bastion
docker stop monitor
docker container rm bastion
docker container rm monitor
docker image rm bastion:latest
docker image rm monitor:latest
docker image prune -f
docker network rm servicio
docker network rm backup
docker network rm oym
docker ps --all