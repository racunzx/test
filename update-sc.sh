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
versi=$(cat /home/version)
if [[ $versi == 1.1 ]]; then
echo "You Have The Latest Version"
exit 0
fi
clear
echo -e "$green   =============================================$NC"
echo -e "$green                     UPDATE SCRIPT        $NC"
echo -e "$green   =============================================$NC"
sleep 5
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/playboye/test/main/menu.sh"
# menu ssh-ovpn
wget -O m-sshovpn "https://raw.githubusercontent.com/playboye/test/main/m-sshovpn.sh"
# menu wg
wget -O m-wg "https://raw.githubusercontent.com/playboye/test/main/m-wg.sh"
# menu ssr
wget -O m-ssr "https://raw.githubusercontent.com/playboye/test/main/m-ssr.sh"
# menu xray
wget -O xray-vmess "https://raw.githubusercontent.com/playboye/test/main/xray-vmess.sh"
wget -O xray-vless "https://raw.githubusercontent.com/playboye/test/main/xray-vless.sh"
wget -O xray-xtls "https://raw.githubusercontent.com/playboye/test/main/xray-xtls.sh"
# menu trojan
wget -O m-trojan "https://raw.githubusercontent.com/playboye/test/main/m-trojan.sh"
# menu system
wget -O m-system "https://raw.githubusercontent.com/playboye/test/main/m-system.sh"
chmod +x menu
chmod +x m-sshovpn
chmod +x m-wg
chmod +x m-ssr
chmod +x xray-vmess
chmod +x xray-vless
chmod +x xray-xtls
chmod +x m-trojan
chmod +x m-system
cd
rm /home/version
echo "1.1" > /home/version
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
