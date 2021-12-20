#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"

clear
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "Name : Restart Service"
echo -e ""
echo -e "     [1] Restart All Services"
echo -e "     [2] Restart OpenSSH"
echo -e "     [3] Restart Dropbear"
echo -e "     [4] Restart Stunnel4"
echo -e "     [5] Restart OpenVPN"
echo -e "     [6] Restart Squid"
echo -e "     [7] Restart Nginx"
echo -e "     [8] Restart Badvpn"
echo -e "     [9] Restart XRAY"
echo -e "    [10] Restart TROJAN"
echo -e "     [x] Exit"
echo -e ""
read -p "    Select From Options [1-8 or x] :  " Restart
echo -e ""
echo -e "======================================"
sleep 1
clear
case $Restart in
                1)
                clear
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel4 restart
                /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                /etc/init.d/squid restart
                systemctl restart xray.service
                systemctl restart xray@none.service
                systemctl restart xray@vless.service
                systemctl restart xray@vnone.service
                systemctl restart xray@tcp_xtls.service
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "          Service/s Restarted         " 
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                2)
                clear
                /etc/init.d/ssh restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "         SSH Service Restarted        "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                3)
                clear
                /etc/init.d/dropbear restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "       Dropbear Service Restarted     "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                4)
                clear
                /etc/init.d/stunnel4 restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "        Stunnel4 Service Restarted    "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                5)
                clear
                /etc/init.d/openvpn restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "       OpenVPN Service Restarted      "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                6)
                clear
                /etc/init.d/squid restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "        Squid3 Service Restarted      "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                7)
                clear
                /etc/init.d/nginx restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "         Nginx Service Restarted      "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                8)
                clear
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "    Badvpn  Badvpn Service Restarted  "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                9)
                clear
                systemctl restart xray.service
                systemctl restart xray@none.service
                systemctl restart xray@vless.service
                systemctl restart xray@vnone.service
                systemctl restart xray@tcp_xtls.service
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "         XRAY Service Restarted      "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                10)
                clear
                systemctl restart trojan
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "         TROJAN Service Restarted      "
                echo -e ""
                echo -e "======================================"
                exit
                ;;                               
                x)
                clear
                exit
                ;;
        esac
