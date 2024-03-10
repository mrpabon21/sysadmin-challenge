#!/bin/bash
# deploy_all.sh

rm -fr /home/walter/.ssh/known_hosts

### create a new docker bridge network
docker network create servicio --subnet 192.168.10.0/24 --gateway 192.168.10.1 -d bridge
docker network create backup --subnet 192.168.20.0/24 --gateway 192.168.20.1 -d bridge
docker network create oym --subnet 192.168.30.0/24 --gateway 192.168.30.1 -d bridge

### build and run bastion
docker build -t bastion:latest --build-arg server=bastion bastion/.
docker run -d --name bastion --hostname bastion --network servicio --network backup --network oym --volume bastion_backup:/opt/backup bastion:latest

### build and run monitor
docker build -t monitor:latest --build-arg server=monitor monitor/.
docker run -d --name monitor --hostname monitor --network servicio --network backup --network oym \
--volume monitor_grafana_data:/opt/grafana-10.0.0/data --volume monitor_grafana_conf:/opt/grafana-10.0.0/conf monitor:latest