#!/bin/bash

SERVER="http://T04-00-Ubuntu.local:5000/keepalive"

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

