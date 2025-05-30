#!/bin/bash

SERVER="https://T04-00-Ubuntu.local/server/keepalive"

HOSTNAME=$(/bin/hostname)
IP=$(/bin/hostname -I | /usr/bin/awk '{print $1}')
USER=$(/usr/bin/whoami)
OS=$(/usr/bin/lsb_release -d | /usr/bin/awk -F"\t" '{print $2}')

/usr/bin/curl -s -X POST "$SERVER" \
    -H "Content-Type: application/json" \
    -d "{
        \"hostname\": \"$HOSTNAME\",
        \"ip\": \"$IP\",
        \"user\": \"$USER\",
        \"os\": \"$OS\"
    }"

