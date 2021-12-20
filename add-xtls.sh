#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
#EDIT IZIN
clear
domain=$(cat /etc/v2ray/domain)
xtls="$(cat ~/log-install.txt | grep -w "Xray Vless Tcp XTLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/tcp_xtls.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
read -p "BUG TELCO: " BUG
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xtls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/tcp_xtls.json
vlesslink1="vless://${uuid}@${domain}:$xtls?flow=xtls-rprx-direct&encryption=none&security=tls&sni=$BUG&type=tcp&headerType=none&host=$BUG#$user@BOY3VPN"
vlesslink2="vless://${uuid}@${domain}:$xtls?flow=xtls-rprx-splice&encryption=none&security=tls&sni=$BUG&type=tcp&headerType=none&host=$BUG#$user@BOY3VPN"
systemctl restart xray@tcp_xtls
clear
echo -e ""
echo -e "================================="
echo -e "            XRAY TCP XTLS          "
echo -e "================================="
echo -e "Remarks        : ${user}"
echo -e "HOST IP        : ${MYIP}"
echo -e "Domain         : ${domain}"
echo -e "BUG TELCO      : ${BUG}"
echo -e "port XTLS      : $xtls"
echo -e "id             : ${uuid}"
echo -e "Encryption     : none"
echo -e "network        : tcp"
echo -e "================================="
echo -e "link xtls-rprx-direct : ${vlesslink1}"
echo -e "================================="
echo -e "link xtls-rprx-splice : ${vlesslink2}"
echo -e "================================="
echo -e "Expired On     : $exp"
