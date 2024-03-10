FROM ubuntu:22.04

ARG server

ENV server=$server

ARG user=administrator

COPY ${server}_* /tmp/

RUN apt update && apt install sudo ansible -y

RUN ansible-playbook /tmp/${server}_playbook.yml

COPY authorized_keys_bastion /home/${user}/.ssh/authorized_keys

CMD ./tmp/${server}_start_all.sh