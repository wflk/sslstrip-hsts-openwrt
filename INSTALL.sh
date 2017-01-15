#!/bin/bash
#
# Installation script for SSLstrip2 + DNS2proxy for the WiFi Pineapple NANO + TETRA.
# I consider this a dirty fix to get sslstrip2 running. It's needed because the upstream libraries are not up to date.
#
# Written by: Andreas Nilsen - adde88@gmail.com - https://www.github.com/adde88
#
# Variables and colors.
RED='\033[0;31m'
NC='\033[0m'
sslstrip_version="0.9" 
SSLSTRIP_IPK="https://github.com/adde88/sslstrip-hsts-openwrt/raw/master/sslstrip-hsts_"$sslstrip_version"_ar71xx.ipk"
INSTROOT=""
#
#	Starting Installtion.
echo -e "${RED}Installing: ${NC}SSLstrip2 + DNS2Proxy."
echo -e "Go grab a cup of coffee, this can take a little while...\n"
# Download installation-files to temporary directory, and then update OPKG repositories.
cd /tmp
opkg update
wget "$SSLSTRIP_IPK"
#
# Creating sym-link between python-directories located on the sd-card and internally.
# The main-directory will be located on the sd-card (/sd)
# This will only happen on the Pineapple NANO.
if [ -e /sd ]; then
	# sym-link & nano install
	INSTROOT="/sd"
	rm -r /usr/lib/python2.7
	mkdir -p /sd/usr/lib/python2.7
	ln -s /sd/usr/lib/python2.7 /usr/lib/python2.7
	opkg --dest sd --force-overwrite install sslstrip-hsts_"$sslstrip_version"_ar71xx.ipk
else
	# Tetra installation / general install.
	opkg --force-overwrite install sslstrip-hsts_"$sslstrip_version"_ar71xx.ipk
fi
# Cleanup
rm sslstrip-hsts_"$sslstrip_version"_ar71xx.*
python ${INSTROOT}/usr/share/sslstrip2/setup.py install
chmod +x ${INSTROOT}/usr/share/dns2proxy/dns2proxy.py
ln -s ${INSTROOT}/usr/share/dns2proxy/dns2proxy.py /usr/bin/dns2proxy
echo -e "${RED}Installation completed!"
exit 0