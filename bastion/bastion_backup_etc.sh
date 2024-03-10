#!/bin/bash

exec > /var/log/backup_files.log 2>&1

filedate=$(date "+%F-%H%M%S")

echo "### START $(date "+%F-%H%M%S")"

# backup etc configs
tar -czf /opt/backup/etc_$filedate.tar.gz /etc/

echo "### END $(date "+%F-%H%M%S")"

mail -s "Backup finished" user1@server1 < /var/log/backup_files.log