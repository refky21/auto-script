#!/bin/bash
# //====================================================
# //  MangKanya Dev-Store - Since 2023
# //====================================================
# //  System Request : Debian 9+/Ubuntu 18.04+/20+
# //  Author         : mangkanya_dev
# //  Develop        : Mang Kanya Developer
# //  email          : budi.tejosari@gmail.com
# //  telegram       : https://t.me/mangkanya_dev_bot
# //====================================================

# ALL VARAIABLE

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date -d "0 days" +"%Y-%m-%d")
ipsaya=$(wget -qO- ipinfo.io/ip)	

URL_SERVER="https://nps.jualapak.com/akses/data.json"
AKSES=$(curl -s "$URL_SERVER")

REPO="https://raw.githubusercontent.com/refky21/auto-script/main"

DATA_LISENSI=$(echo "$AKSES" | jq -r --arg ip "$ipsaya" '.response.data | select(.ip == $ip) | .license')
IZIN=$(echo "$AKSES" | jq -r --arg ip "$ipsaya" '.response.data | select(.ip == $ip) | .ip')
username=$(echo "$AKSES" | jq -r --arg ip "$ipsaya" '.response.data | select(.ip == $ip) | .username')
expx=$(echo "$AKSES" | jq -r --arg ip "$ipsaya" '.response.data | select(.ip == $ip) | .exp_date')

red() { echo -e "\\033[32;1m${*}\\033[0m"; }
RED='\033[0;31m'
NC='\e[0m'
gray="\e[1;30m"
Blue="\033[1;36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
BGX="\033[42m"

checking_sc() {
  if [[ $biji < $expx ]]; then
    echo -ne "${green}Akses Valid${NC}"
  else
    echo -e " "
    echo -e " ${z} ███╗   ███╗ █████╗ ███╗   ██╗ ██████╗     ██╗  ██╗ █████╗ ███╗   ██╗██╗   ██╗ █████╗  ${NC}"
	echo -e " ${z} ████╗ ████║██╔══██╗████╗  ██║██╔════╝     ██║ ██╔╝██╔══██╗████╗  ██║╚██╗ ██╔╝██╔══██╗ ${NC}"
	echo -e " ${z} ██╔████╔██║███████║██╔██╗ ██║██║  ███╗    █████╔╝ ███████║██╔██╗ ██║ ╚████╔╝ ███████║ ${NC}"
	echo -e " ${z} ██║╚██╔╝██║██╔══██║██║╚██╗██║██║   ██║    ██╔═██╗ ██╔══██║██║╚██╗██║  ╚██╔╝  ██╔══██║ ${NC}"
	echo -e " ${z} ██║ ╚═╝ ██║██║  ██║██║ ╚████║╚██████╔╝    ██║  ██╗██║  ██║██║ ╚████║   ██║   ██║  ██║ ${NC}"
	echo -e " ${z} ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝ ${NC}"
	echo -e " ${z} ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███████╗██████╗ ███████╗    ${NC}"
	echo -e " ${z} ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝    ${NC}"
	echo -e " ${z} ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝█████╗  ██████╔╝███████╗    ${NC}"
	echo -e " ${z} ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗╚════██║    ${NC}"
	echo -e " ${z} ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ███████╗██║  ██║███████║    ${NC}"
	echo -e " ${z} ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝    ${NC}" 
    echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
    echo -e " ${z}│      Oops, Akses Ditolak, Silahkan Konfirmasi Admin      │${NC}"
    echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
    echo -e ""
    echo -e "                      ${RED}AKSES DITOLAK !${NC}"
    echo -e "              \033[0;33mVPS Kamu${NC} $ipsaya \033[0;33mdi Tidak Ada Akses${NC}"
    echo -e "                \033[0;33muntuk menggunakan script ini${NC}"
    echo -e "                       \033[0;33mContact Admin :${NC}"
    echo -e "                 \033[0;36mTelegram t.me/mangkanya_dev_bot${NC}"
    echo -e "                 ${GREEN}WhatsApp wa.me/6285869279388${NC}"
    echo -e ""
    echo -e "\033[1;93m❒══════════════════════════════════════════════════════════❒   \033[0m"
    exit
  fi
}

echo -e "\e[32mloading...\e[0m"
checking_sc


clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
    wget $REPO/limit/menu.zip
    clear
    unzip menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu
    rm -rf menu.zip
    rm -rf update.sh
}
netfilter-persistent
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m     UPDATE SCRIPT MK-DEV       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "  \033[1;91m update script service\033[1;37m"
fun_bar 'res1'
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "sucess update latest script"
echo -e " ${GREEN} Back to menu in 3 sec ${NC}"
sleep 3
menu

###########- COLOR CODE -##############