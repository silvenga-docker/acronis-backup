#!/bin/bash

root_password=`date +%s | sha1sum | head -c 12 ; echo`
echo "Updating root's password to ${root_password}."
echo "root:${root_password}" | chpasswd

echo "Removing IPv6 localhost from /etc/hosts."
# Sed can't always modify this thing in place?
sed -e 's/localhost ip6-localhost/ip6-localhost/g' /etc/hosts > /etc/hosts.tmp
cat /etc/hosts.tmp > /etc/hosts
rm /etc/hosts.tmp

echo "Ensuring data directories exist."
mkdir -p /data/Acronis
rsync -a /var/lib/Acronis /data/
rm -r /var/lib/Acronis
ln -sfn /data/Acronis /var/lib/

echo "Starting Acronis via init."
/etc/init.d/acronis_agent start
/etc/init.d/acronis_ams start
/etc/init.d/acronis_asm start
/etc/init.d/acronis_zmqgw start

trap 'killall' INT TERM

killall() {
    # https://unix.stackexchange.com/a/55922/107654
    echo "Shutting down Acronis via init."
    /etc/init.d/acronis_agent stop
    /etc/init.d/acronis_ams stop
    /etc/init.d/acronis_asm stop
    /etc/init.d/acronis_zmqgw stop
    echo "DONE"
    exit 0
}

trap 'err_report $LINENO' ERR
err_report() {
    echo "An error occured on line $1"
    exit 1
}

echo "Waiting..."

sleep infinity & wait