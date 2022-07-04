#!/bin/bash
RED='\033[0;31m'
red="\e[1;31m"
green="\e[0;32m"
NC="\e[0m"
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
MYIP=$(curl -sS ipinfo.io/ip)

#GETTING
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
clear

# CHEK STATUS                                                                                                                                                                 
openvpn_service="$(systemctl show openvpn.service --no-page)"                                                                                                                 
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)                                                                                                        
#status_openvpn=$(/etc/init.d/openvpn status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                               
#status_ss="$(systemctl show shadowsocks-libev.service --no-page)"                                                                                             
#ss_tls=$(echo "${status_ss}" | grep 'ActiveState=' | cut -f2 -d=)                                                                                                        
#ssr_status=$(/etc/init.d/ssrmu status | grep Active | awk '{print $0}' | cut -d "(" -f2 | cut -d ")" -f1)                                               
ss_tls=$(systemctl status shadowsocks-libev.service  | grep Active | awk '{print $0}' | cut -d "(" -f2 | cut -d ")" -f1)                                               

#ssh_status=$(systemctl status shadowsocks-libev-server@http | grep Active | awk '{print $0}' | cut -d "(" -f2 | cut -d ")" -f1)                                              
#status_ss_http="$(systemctl show shadowsocks-libev-server@http.service --no-page)"                                                                                           
#ss_http=$(echo "${status_ss_http}" | grep 'ActiveState=' | cut -f2 -d=)                                                                                                      
#sssohtt=$(systemctl status shadowsocks-libev-server@*-http | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                               
#status="$(systemctl show shadowsocks-libev.service --no-page)"                                                                                                               
#status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                                                                                                          

tls_v2ray_status=$(systemctl status v2ray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                             
nontls_v2ray_status=$(systemctl status v2ray@none | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                         
vless_tls_v2ray_status=$(systemctl status v2ray@vless | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                       
vless_nontls_v2ray_status=$(systemctl status v2ray@vnone | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                   
trojan_v2ray_status=$(systemctl status trojan | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                   

vless_xtls_status=$(systemctl status xtls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                 
vless_tcp_xray_status=$(systemctl status xr-vl-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                   
vless_ntcp_xray_status=$(systemctl status xr-vl-ntls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                   
vmess_tcp_xray_status=$(systemctl status xr-vm-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                   
vmess_ntcp_xray_status=$(systemctl status xr-vm-ntls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                   
vmess_mkcp_xray_status=$(systemctl status xr-vm-mk | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                   
trojan1_server=$(systemctl status x-tr | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                    
trojan3_server=$(systemctl status trojanxtls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                              
trojan2_server=$(systemctl status trojangrpc | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                              

#grpc="$(systemctl show vmess-grpc.service --no-page)"                                                                                                                         
#vmessgrpc=$(echo "${grpc}" | grep 'ActiveState=' | cut -f2 -d=)                                                                                                               
#grpcc="$(systemctl show vless-grpc.service --no-page)"                                                                                                                        
#vlessgrpc=$(echo "${grpcc}" | grep 'ActiveState=' | cut -f2 -d=)                                                                                                              

vmessgrpc=$(systemctl status vmess-grpc | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                   
vlessgrpc=$(systemctl status vless-grpc | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                   

ssr_status=$(systemctl status ssrmu | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                      
trojan_server=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                     
nginx_service=$(/etc/init.d/nginx status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                             
stunnel_service=$(/etc/init.d/stunnel4 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                             
#sstp_service=$(systemctl status accel-ppp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                
squid_service=$(/etc/init.d/squid status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                  
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                      
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                    
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                            

wg="$(systemctl show wg-quick@wg0.service --no-page)"                                                                                                                        
swg=$(echo "${wg}" | grep 'ActiveState=' | cut -f2 -d=)                                                                                                                      
#trgo="$(systemctl show trojan-go.service --no-page)"                                                                                                                         
strgo=$(echo "${trgo}" | grep 'ActiveState=' | cut -f2 -d=)                                                                                                                   
#sswg=$(systemctl status wg-quick@wg0 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                     
wstls=$(systemctl status ws-stunnel | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                       
wsdrop=$(systemctl status websocket | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                       
wsovpn=$(systemctl status ws-ovpn | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                         
#wsopen=$(systemctl status ws-openssh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                     
osslh=$(systemctl status sslh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                             

ohp=$(systemctl status dropbear-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                       
ohq=$(systemctl status openvpn-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                        
ohr=$(systemctl status ssh-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                            
                                                                                                                                                                              
# COLOR VALIDATION                                                                                                                                                            
RED='\033[0;31m'                                                                                                                                                              
NC='\033[0m'                                                                                                                                                                  
GREEN='\033[0;32m'                                                                                                                                                            
ORANGE='\033[0;33m'                                                                                                                                                           
BLUE='\033[0;34m'                                                                                                                                                             
PURPLE='\033[0;35m'                                                                                                                                                           
CYAN='\033[0;36m'                                                                                                                                                             
LIGHT='\033[0;37m'                                                                                                                                                            
clear

# STATUS SERVICE Shadowsocks HTTPS
if [[ $ssr_status == "running" ]]; then
  status_ssr=" ${GREEN}Running ${NC}( No Error )${NC}"
else
  status_ssr="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE Shadowsocks HTTP
if [[ $ss_tls == "running" ]]; then
  ss_status=" ${GREEN}Running ${NC}( No Error )${NC}"
else
  ss_status="${RED}  Not Running ${NC}  ( Error )${NC}
fi

# STATUS SERVICE OPENVPN
if [[ $oovpn == "active" ]]; then
  status_openvpn=" ${GREEN}Running ${NC}( No Error )${NC}"
else
  status_openvpn="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_ssh="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE  SQUID 
if [[ $squid_service == "running" ]]; then 
   status_squid=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_squid="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE  VNSTAT 
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_vnstat="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE  CRONS 
if [[ $cron_service == "running" ]]; then 
   status_cron=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_cron="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE  FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_fail2ban="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray=" ${GREEN}Running${NC} ( No Error )${NC}"
else
   status_tls_v2ray="${RED}  Not Running${NC}   ( Error )${NC}"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_nontls_v2ray="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE VLESS TLS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless=" ${GREEN}Running${NC} ( No Error )${NC}"
else
  status_tls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE VLESS NON TLS V2RAY
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless=" ${GREEN}Running${NC} ( No Error )${NC}"
else
  status_nontls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE TROJAN V2RAY
if [[ $trojan_v2ray_status == "running" ]]; then
  status_v2ray_trojan=" ${GREEN}Running${NC} ( No Error )${NC}"
else
  status_v2ray_trojan="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# VmessGrpc status
if [[ $vmessgrpc == "running" ]] ; then
  status_grpc=" ${GREEN}Running${NC} ( No Error )${NC}"
else
  status_grpc="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# VlessGrpc status
if [[ $vlessgrpc == "running" ]] ; then
  status_grpcc=" ${GREEN}Running${NC} ( No Error )${NC}"
else
  status_grpcc="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE TROJAN
if [[ $trojan1_server == "running" ]]; then 
   status_virus_trojan1=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_virus_trojan1="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE TROJAN GRPC                                                                                         
if [[ $trojan2_server == "running" ]]; then                                                                         
   status_virus_trojan2=" ${GREEN}Running ${NC}( No Error )${NC}"                                                   
else                                                                                                                
   status_virus_trojan2="${RED}  Not Running ${NC}  ( Error )${NC}"                                                 
fi

# STATUS SERVICE TROJAN XTLS                                                                                       
if [[ $trojan3_server == "running" ]]; then                                                                         
   status_virus_trojan3=" ${GREEN}Running ${NC}( No Error )${NC}"                                                   
else                                                                                                                
   status_virus_trojan3="${RED}  Not Running ${NC}  ( Error )${NC}"                                                 
fi

# STATUS SERVICE VLESS XTLS                                                                                         
if [[ $vless_xtls_status == "running" ]]; then                                                                         
   status_xtls_vless=" ${GREEN}Running ${NC}( No Error )${NC}"                                                   
else                                                                                                                
   status_xtls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"                                                 
fi

# STATUS SERVICE VMESS TCP                                                                                         
if [[ $vmess_tcp_xray_status == "running" ]]; then                                                                         
   status_tcp_vmess=" ${GREEN}Running ${NC}( No Error )${NC}"                                                   
else                                                                                                                
   status_tcp_vmess="${RED}  Not Running ${NC}  ( Error )${NC}"                                                 
fi

# STATUS SERVICE VMESS NTCP                                                                                          
if [[ $vmess_ntcp_xray_status == "running" ]]; then                                                                         
   status_ntcp_vmess=" ${GREEN}Running ${NC}( No Error )${NC}"                                                   
else                                                                                                                
   status_ntcp_vmess="${RED}  Not Running ${NC}  ( Error )${NC}"                                                 
fi

# STATUS SERVICE VMESS MKCP                                                                                         
if [[ $vmess_mkcp_xray_status == "running" ]]; then                                                                         
   status_mkcp_vmess=" ${GREEN}Running ${NC}( No Error )${NC}"                                                   
else                                                                                                                
   status_mkcp_vmess="${RED}  Not Running ${NC}  ( Error )${NC}"                                                 
fi

# STATUS SERVICE VLESS TCP                                                                                         
if [[ $vless_tcp_xray_status == "running" ]]; then                                                                         
   status_tcp_vless=" ${GREEN}Running ${NC}( No Error )${NC}"                                                   
else                                                                                                                
   status_tcp_vless="${RED}  Not Running ${NC}  ( Error )${NC}"                                                 
fi

# STATUS SERVICE VLESS NTCP                                                                                         
if [[ $vless_ntcp_xray_status == "running" ]]; then                                                                         
   status_ntcp_vless=" ${GREEN}Running ${NC}( No Error )${NC}"                                                   
else                                                                                                                
   status_ntcp_vless="${RED}  Not Running ${NC}  ( Error )${NC}"                                                 
fi

# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh=" ${GREEN}Running${NC} ( No Error )${NC}"
else
   status_beruangjatuh="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE STUNNEL
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_stunnel="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET TLS
if [[ $wstls == "running" ]]; then 
   swstls=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   swstls="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET DROPBEAR
if [[ $wsdrop == "running" ]]; then 
   swsdrop=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   swsdrop="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET OPEN OVPN
if [[ $wsovpn == "running" ]]; then 
   swsovpn=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   swsovpn="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE SSLH / SSH
if [[ $osslh == "running" ]]; then 
   sosslh=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   sosslh="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS OHP DROPBEAR
if [[ $ohp == "running" ]]; then 
   sohp=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   sohp="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS OHP OpenVPN
if [[ $ohq == "running" ]]; then 
   sohq=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   sohq="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS OHP SSH
if [[ $ohr == "running" ]]; then 
   sohr=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   sohr="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET OPENSSH
if [[ $wsopen == "running" ]]; then 
   swsopen=" ${GREEN}Running ${NC}( No Error )${NC}" 
else
   swsopen="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

if [[ $nginx_service == "running" ]]; then 
   status_nginx=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_nginx="${RED}  Not Running ${NC}  ( Error )${NC}"
fi 

clear

domain=$(cat /etc/xray/domain)
echo -e ""                                                                                              
echo -e  " ${CYAN}╠════════════════════════════════════════════════════════════╣${NC}"                  
echo -e  " $CYAN║                 $RED    ┃ SYSTEM-SERVICE ┃   $NC                  $CYAN║$NC"          
echo -e  " ${CYAN}╠════════════════════════════════════════════════════════════╝${NC}"                  
echo -e " $CYAN║$NC Hostname    :$LIGHT $HOSTNAME"                                                      
echo -e " $CYAN║$NC Public IP   :$LIGHT $MYIP"                                                          
echo -e " $CYAN║$NC Domain      :$LIGHT $domain"                                                        
echo -e  " ${CYAN}╠════════════════════════════════════════════════════════════╣${NC}"                  
echo -e  " $CYAN║                 $RED    ┃ SERVICE-INFORMATION ┃   $NC             $CYAN║$NC"          
echo -e  " ${CYAN}╠════════════════════════════════════════════════════════════╝${NC}"                  
echo -e " $CYAN║$NC SSH / TUN               :$status_ssh"                                              
echo -e " $CYAN║$NC OpenVPN                 :$status_openvpn"                                          
echo -e " $CYAN║$NC Dropbear                :$status_beruangjatuh"                                      
echo -e " $CYAN║$NC Stunnel4                :$status_stunnel"                                           
echo -e " $CYAN║$NC Squid                   :$status_squid"                                             
echo -e " $CYAN║$NC Fail2Ban                :$status_fail2ban"                                          
echo -e " $CYAN║$NC Crons                   :$status_cron"                                              
echo -e " $CYAN║$NC Vnstat                  :$status_vnstat"                                           
echo -e " $CYAN║$NC Nginx                   :$status_nginx"                                              
echo -e " $CYAN║$NC XRAYS Vmess TCP         :$status_tcp_vmess"                                        
echo -e " $CYAN║$NC XRAYS Vmess None TCP    :$status_ntcp_vmess"                                      
echo -e " $CYAN║$NC XRAYS Vmess KCP         :$status_mkcp_vmess"                                        
echo -e " $CYAN║$NC XRAYS Vmess GRPC        :$status_grpc"                                        
echo -e " $CYAN║$NC XRAYS Vless TCP TLS     :$status_tcp_vless"                                         
echo -e " $CYAN║$NC XRAYS Vless None TCP    :$status_ntcp_vless"                                      
echo -e " $CYAN║$NC XRAYS Vless XTLS        :$status_xtls_vless"                                        
echo -e " $CYAN║$NC XRAYS Vless GRPC        :$status_grpcc"                                      
echo -e " $CYAN║$NC XRAYS Trojan            :$status_virus_trojan1"                                      
echo -e " $CYAN║$NC XRAYS Trojan GRPC       :$status_virus_trojan2"                                     
echo -e " $CYAN║$NC XRAYS Trojan XTLS       :$status_virus_trojan3"                                     
echo -e " $CYAN║$NC V2RAYS Trojan           :$status_v2ray_trojan"                                   
echo -e " $CYAN║$NC V2RAYS Vmess WS TLS     :$status_tls_v2ray"                                    
echo -e " $CYAN║$NC V2RAYS Vmess WS NTLS    :$status_nontls_v2ray"                                    
echo -e " $CYAN║$NC V2RAYS Vless WS TLS     :$status_tls_vless"                                    
echo -e " $CYAN║$NC V2RAYS Vless WS NTLS    :$status_nontls_vless"                                    
echo -e " $CYAN║$NC SHADOWSOCKSR            :$status_ssr"                                                  
echo -e " $CYAN║$NC SHADOWSOCKS-LIBEV       :$ss_status"                                                   
echo -e " $CYAN║$NC Websocket TLS           :$swstls"                                                  
echo -e " $CYAN║$NC Websocket None TLS      :$swsdrop"                                                  
echo -e " $CYAN║$NC Websocket Ovpn          :$swsovpn"                                                
echo -e " $CYAN║$NC OHP Dropbear            :$sohp"                                                    
echo -e " $CYAN║$NC OHP OpenVPN             :$sohq"                                                   
echo -e " $CYAN║$NC OHP SSH                 :$sohr"                                                  
echo -e " $CYAN║$NC SSL / SSH Multiplexer   :$sosslh"                                                  
echo -e  " ${CYAN}╠════════════════════════════════════════════════════════════╣${NC}"                  
echo -e  " $CYAN║                    $RED ┃ MANTERNET VPN ┃ $NC                $CYAN     ║$NC"          
echo -e  " ${CYAN}╠════════════════════════════════════════════════════════════╝${NC}"                  
echo ""
