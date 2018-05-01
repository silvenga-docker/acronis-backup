#!/bin/bash

root_password=`date +%s | sha1sum | head -c 12 ; echo`
echo "Updating root's password to ${root_password}."
echo "${root_password}" | passwd root --stdin

echo "Removing IPv6 localhost from /etc/hosts."
# Sed can't always modify this thing in place?
sed -e 's/localhost ip6-localhost/ip6-localhost/g' /etc/hosts > /etc/hosts.tmp
cat /etc/hosts.tmp > /etc/hosts

echo "Starting Acronis via init."
/etc/init.d/acronis_agent start
/etc/init.d/acronis_ams start
/etc/init.d/acronis_asm start
/etc/init.d/acronis_zmqgw start

read -p "Press enter to exit."