#!/bin/bash

# drop incoming traffic
iptables -A INPUT -j DROP

# allow icmp incoming traffic
#iptables -A INPUT -p icmp -j ACCEPT

# open ssh to my host
iptables -A INPUT -p tcp --dport 22 -s 192.168.30.1 -j ACCEPT

# open grafana port to my host
iptables -A INPUT -p tcp --dport 3000 -s 192.168.30.1 -j ACCEPT