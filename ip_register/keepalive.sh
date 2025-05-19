#!/bin/bash

SERVER="http://T04-00-Ubuntu:5000/keepalive"
HOSTNAME=$(hostname)
IP=$(hostname -I | awk '{print $1}')
USER=$(whoami)
OS=$(lsb_release -d | awk -F"\t" '{print $2}')

curl -s -X POST "$SERVER" \
    -H "Content-Type: application/json" \
    -d "{
        \"hostname\": \"$HOSTNAME\",
        \"ip\": \"$IP\",
        \"user\": \"$USER\",
        \"os\": \"$OS\"
    }"
