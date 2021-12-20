#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
#EDIT IZIN
clear
domain=$(cat /etc/v2ray/domain)
tls="$(cat ~/log-install.txt | grep -w "Xray Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Xray Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/vless.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vless.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vnone.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/xray&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/xray&encryption=none&type=ws#${user}"
systemctl restart xray@vless
systemctl restart xray@vnone
clear
echo -e ""
echo -e "================================="
echo -e "            XRAY VLESS          "
echo -e "================================="
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "port TLS       : $tls"
echo -e "port none TLS  : $none"
echo -e "id             : ${uuid}"
echo -e "Encryption     : none"
echo -e "network        : ws"
echo -e "path           : /xray"
echo -e "================================="
echo -e "link TLS       : ${vlesslink1}"
echo -e "================================="
echo -e "link none TLS  : ${vlesslink2}"
echo -e "================================="
echo -e "Expired On     : $exp"
