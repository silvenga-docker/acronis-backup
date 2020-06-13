#!/bin/bash

while ! nc -z $DB_HOSTNAME 5432 ; do
    echo "Waiting for database ${DB_HOSTNAME} to come up."
    sleep 3
done

if [ ! -e /etc/Acronis/Scripts/init_common.sh ]; then
    /opt/installer \
            --auto \
            --skip-prereq-check \
            --skip-svc-start \
            --web-server-port=9877 \
            --ams-tcp-port=7780 \
            --id=AcronisCentralizedManagementServer \
            --language=en \
            --debug
fi

if [ -e /etc/Acronis/Scripts/init_common.sh ]; then
    /etc/init.d/acronis_ams start
    /etc/init.d/acronis_asm start
    /etc/init.d/acronis_zmqgw start
else
    echo "Failed to install the Acronis."
    exit 1
fi
