#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
bd='\e[1m'
NC='\e[0m'

#getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | awk '{print $4}' | grep $MYIP )
if [[ $MYIP = $IZIN ]]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
rm -f menu_xray
exit 0
fi    
clear

# RUN
ssr_folder="/usr/local/xray"
status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

if [[ -e ${ssr_folder} ]]; then
if [[ $status == "running" ]]; then
        Current_status=" ${GREEN}XRAY INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
        Current_status=" ${GREEN}XRAY INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
cd "${ssr_folder}"
else
        Current_status=" ${RED}XRAY NOT INSTALL ${NC}"
fi
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[0;100;31m               • MENU XRAY •                \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
echo -e "Current status:$Current_status "
echo -e""
echo -e "[${CYAN}•1${NC}] $bd Create Account Vmess TCP ${NC}"
echo -e "[${CYAN}•2${NC}] $bd Create Account Vless TCP ${NC}"
echo -e "[${CYAN}•3${NC}] $bd Create Account Trojan ${NC}"
echo -e "[${CYAN}•4${NC}] $bd Create Account Xtls ${NC} "
echo -e "[${CYAN}•5${NC}] $bd Create Account GRPC ${NC}"
echo -e "[${CYAN}•6${NC}] $bd Create Account TR-XTLS ${NC}"
echo -e "[${CYAN}•7${NC}] $bd Create Account TR-GRPC ${NC}"
echo -e""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
echo -e""
echo -e "[${CYAN}•8${NC}] $bd Delete Account Vmess TCP ${NC}"
echo -e "[${CYAN}•9${NC}] $bd Delete Account Vless TCP ${NC}"
echo -e "[${CYAN}10${NC}] $bd Delete Account Trojan ${NC}"
echo -e "[${CYAN}11${NC}] $bd Delete Account Xtls ${NC}"
echo -e "[${CYAN}12${NC}] $bd Delete Account GRPC ${NC}"
echo -e "[${CYAN}13${NC}] $bd Delete Account TR-XTLS ${NC}"
echo -e "[${CYAN}14${NC}] $bd Delete Account TR-GRPC ${NC}"
echo -e""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
echo -e""
echo -e "[${CYAN}15${NC}] $bd Renew Account Vmess TCP ${NC}"
echo -e "[${CYAN}16${NC}] $bd Renew Account Vless TCP ${NC}"
echo -e "[${CYAN}17${NC}] $bd Renew Account Trojan ${NC}"
echo -e "[${CYAN}18${NC}] $bd Renew Account Xtls ${NC}"
echo -e "[${CYAN}19${NC}] $bd Renew Account GRPC ${NC}"
echo -e "[${CYAN}20${NC}] $bd Renew Account TR-XTLS ${NC}"
echo -e "[${CYAN}21${NC}] $bd Renew Account TR-GRPC ${NC}"
echo -e""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
echo -e""
echo -e "[${CYAN}22${NC}] $bd Check Account Vmess TCP ${NC}"
echo -e "[${CYAN}23${NC}] $bd Check Account Vless TCP ${NC}"
echo -e "[${CYAN}24${NC}] $bd Check Account Trojan ${NC}"
echo -e "[${CYAN}25${NC}] $bd Check Account Xtls ${NC}"
echo -e "[${CYAN}26${NC}] $bd Check Account GRPC ${NC}"
echo -e "[${CYAN}27${NC}] $bd Check Account TR-XTLS ${NC}"
echo -e "[${CYAN}28${NC}] $bd Check Account TR-GRPC ${NC}"
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
echo -e""
read -p " silahkan masukkan nomor [1-8 or x] :  "  menu
echo -e ""
case $menu in
1)
addxvmess
;;
2)
addxvless
;;
3)
addxtrojan
;;
4)
addxtls
;;
5)
addgrpc
;;
6)
addtrxtls
;;
7)
addtrgrpc
;;
8)
delxvmess
;;
9)
delxvless
;;
10)
delxtrojan
;;
11)
delxtls
;;
12)
delgrpc
;;
13)
deltrxtls
;;
14)
deltrgrpc
;;
15)
renewxvmess
;;
16)
renewxvless
;;
17)
renewxtrojan
;;
18)
renewxtls
;;
19)
renewgrpc
;;
20)
renewtrxtls
;;
21)
renewtrgrpc
;;
22)
cekxvmess
;;
23)
cekxvless
;;
24)
cekxtrojan
;;
25)
cekxtls
;;
26)
cekgrpc
;;
27)
cektrxtls
;;
28)
cektrgrpc
;;
x)
sleep 1
menu
;;
*)
echo "Input The Correct Number"
sleep 1
menu-xray
;;
esac
