#!/bin/bash

# flushing all rules
iptables -F DOCKER-USER
 
# setting default filter policy
iptables -P INPUT DROP

# allow unlimited traffic on loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# allow icmp incoming traffic
#iptables -A INPUT -p icmp -j ACCEPT

# open ssh to my host
iptables -A INPUT -p tcp --dport 22 -s 192.168.30.1 -j ACCEPT

# open grafana port to my host
#iptables -A INPUT -p tcp --dport 3000 -s 192.168.30.1 -j ACCEPT

# open node_exporter port to my host
#iptables -A INPUT -p tcp --dport 9100 -j ACCEPT