#!/bin/bash

exec > /var/log/backup_files.log 2>&1

filedate=$(date "+%F-%H%M%S")

echo "### START $(date "+%F-%H%M%S")"

# backup etc configs
ssh administrator@192.168.30.3 'tar -czf /tmp/monitor_etc_$filedate.tar.gz /etc/ | scp administrator@192.168.30.3:/tmp/monitor_etc_$filedate.tar.gz /opt/backup/'

echo "### END $(date "+%F-%H%M%S")"

#mail -s "Backup finished" user1@server1 < /var/log/backup_files.log