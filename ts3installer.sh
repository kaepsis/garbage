#!/usr/bin/env bash

TS3URL="https://files.teamspeak-services.com/releases/server/3.13.6/teamspeak3-server_linux_amd64-3.13.6.tar.bz2"
FILENAMEWITHEXT="${TS3URL##*/}"
FILENAME="${FILENAMEWITHEXT%-*}"

echo "--------------------------------"
echo " TeamSpeak3 Automatic Installer "
echo "--------------------------------"

echo "[+] Adding machine's host to /etc/hosts file"
echo $(hostname -I | cut -d\  -f1) $(hostname) | sudo tee -a /etc/hosts
sleep 1s
echo "[+] Fetching updates"
sudo apt update -y
echo "[+] Updates fetched"
sleep 2s
echo "[+] Fetching upgrades"
sudo apt upgrade -y
echo "[+] Upgrades fetched"
sleep 2s
echo "[+] Installing TeamSpeak3"
wget $TS3URL
tar xvf $FILENAMEWITHEXT
rm -rf $FILENAMEWITHEXT
mv $FILENAME/ ts3
cd ts3
touch .ts3server_license_accepted
sudo ./ts3server_startscript.sh start
