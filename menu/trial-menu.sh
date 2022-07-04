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

clear
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${RED}          • MENU TRIAL •          ${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e""
echo -e "[${CYAN}•1${NC}] $bd Create TRial XRay VMess Accounts ${NC}"                     
echo -e "[${CYAN}•2${NC}] $bd Create TRial XRay VLess Accounts ${NC}"                    
echo -e "[${CYAN}•3${NC}] $bd Create TRial XRay Trojan Accounts ${NC}"                    
echo -e "[${CYAN}•4${NC}] $bd Create TRial XRay XTLS Accounts ${NC}"                          
echo -e "[${CYAN}•5${NC}] $bd Create TRial XRay GRPC Accounts ${NC}"    
echo -e "[${CYAN}•6${NC}] $bd Create TRial XRAY TR-GRPC Accounts ${NC}"                          
echo -e "[${CYAN}•7${NC}] $bd Create TRial XRAY TR-XTLS Accounts ${NC}"                            
echo -e "[${CYAN}•8${NC}] $bd Create TRial V2Ray Vmess Websocket ${NC}"                         
echo -e "[${CYAN}•9${NC}] $bd Create TRial V2Ray Vless Websocket ${NC}"                        
echo -e "[${CYAN}10${NC}] $bd Create Trial V2Ray Trojan ${NC}"                               
echo -e "[${CYAN}11${NC}] $bd Create TRial ShadowsocksR ${NC}"                             
echo -e "[${CYAN}12${NC}] $bd Create TRial Shadowsocks ${NC}"                           
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
read -p " silahkan masukkan nomor [1-12 or x] :  "  menu
case $menu in 
1)
trialxvmess
;;
2)
trialxvless
;;
3)
trialxtrojan
;;
4)
trialxtls
;;
5)
trialgrpc
;;
6)
trialtrgrpc 
;;
7)
trialtrxtls
;;
8)
trialvmess
;;
9)
trialvless
;;
10)
trialtrojan
;;
11)
trialssr
;;
12)
trialss
;;
x)
sleep 1
menu
;;
*)
echo "Input The Correct Number !"
trial-menu
;;
esac



