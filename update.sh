#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
#EDIT IZIN
sleep 2
clear
echo -e "$green   =============================================$NC"
echo -e "$green                     UPDATE SCRIPT        $NC"
echo -e "$green   =============================================$NC"
sleep 5
wget https://raw.githubusercontent.com/playboye/test/main/update-sc.sh && chmod +x update-sc.sh && screen -S update-sc ./update-sc.sh
rm -f /root/update-sc.sh
sleep 1
echo -e "$green   =============================================$NC"
echo -e "$green                  UPDATE SCRIPT SELESAI   $NC"
echo -e "$green   =============================================$NC"
