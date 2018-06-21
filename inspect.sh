#!/bin/bash
URL="http://ftp.debian.org/debian/pool/main/i/inxi/inxi_2.1.28-1_all.deb"
DEBNAME=${URL##*/}
[[ $(which inxi) ]] || wget http://ftp.debian.org/debian/pool/main/i/inxi/inxi_2.1.28-1_all.deb && sudo dpkg -i $DEBNAME

HOSTFILE="${HOSTNAME}_$(date +%Y%m%d-%H%M%S).txt"
sudo inxi -c0 -v7 | tee $HOSTFILE

# TODO: Send to pastebin as a Proof of Concept
