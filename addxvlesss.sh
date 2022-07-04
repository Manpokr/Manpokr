#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip);


clear
read -p "Username  : " user
if grep -qw "$user" /etc/rare/xray/clients.txt; then
echo -e ""
echo -e "User \e[31m$user\e[0m already exist"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
xray-menu
fi

# // Add User
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xrayxtls.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done

read -p "BUG TELCO : " BUG
read -p "Duration (day) : " duration
uuid=$(cat /proc/sys/kernel/random/uuid)
hariini=$(date -d +${duration}days +%Y-%m-%d)
exp=$(date -d "${exp}" +"%d %b %Y")
domain=$(cat /etc/rare/xray/domain)
xtls="$(cat ~/log-install.txt | grep -w "XRAY VLESS XTLS SPLICE" | cut -d: -f2|sed 's/ //g')"
email=${user}@${domain}
cat>/etc/rare/xray/tls.json<<EOF
      {
       "v": "2",
       "ps": "${user}@IanVPN",
       "add": "${BUG}.${domain}",
       "port": "${xtls}",
       "id": "${uuid}",
       "aid": "0",
       "scy": "auto",
       "net": "ws",
       "type": "none",
       "host": "${BUG}",
       "path": "/xrayvws",
       "tls": "tls",
       "sni": "${BUG}"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1="vmess://$(base64 -w 0 /etc/rare/xray/tls.json)"
echo -e "${user}\t${uuid}\t${exp}" >> /etc/rare/xray/clients.txt
cat /etc/rare/xray/conf/02_VLESS_TCP_inbounds.json | jq '.inbounds[0].settings.clients += [{"id": "'${uuid}'","add": "'${domain}'","flow": "xtls-rprx-direct","email": "'${email}'"}]' > /etc/rare/xray/conf/02_VLESS_TCP_inbounds_tmp.json
    mv -f /etc/rare/xray/conf/02_VLESS_TCP_inbounds_tmp.json /etc/rare/xray/conf/02_VLESS_TCP_inbounds.json
cat /etc/rare/xray/conf/03_VLESS_WS_inbounds.json | jq '.inbounds[0].settings.clients += [{"id": "'${uuid}'","email": "'${email}'"}]' > /etc/rare/xray/conf/03_VLESS_WS_inbounds_tmp.json
    mv -f /etc/rare/xray/conf/03_VLESS_WS_inbounds_tmp.json /etc/rare/xray/conf/03_VLESS_WS_inbounds.json
cat /etc/rare/xray/conf/04_trojan_TCP_inbounds.json | jq '.inbounds[0].settings.clients += [{"password": "'${uuid}'","email": "'${email}'"}]' > /etc/rare/xray/conf/04_trojan_TCP_inbounds_tmp.json
    mv -f /etc/rare/xray/conf/04_trojan_TCP_inbounds_tmp.json /etc/rare/xray/conf/04_trojan_TCP_inbounds.json
cat /etc/rare/xray/conf/05_VMess_WS_inbounds.json | jq '.inbounds[0].settings.clients += [{"id": "'${uuid}'","alterId": 0,"add": "'${domain}'","email": "'${email}'"}]' > /etc/rare/xray/conf/05_VMess_WS_inbounds_tmp.json
    mv -f /etc/rare/xray/conf/05_VMess_WS_inbounds_tmp.json /etc/rare/xray/conf/05_VMess_WS_inbounds.json
cat <<EOF >>"/etc/rare/config-user/${user}"

# // Xray Link
vless://$uuid@$domain:$xtls?flow=xtls-rprx-direct&encryption=none&security=xtls&sni=$BUG&type=tcp&headerType=none&host=$BUG#$user@IanVPN
vless://$uuid@$domain:$xtls?flow=xtls-rprx-splice&encryption=none&security=xtls&sni=$BUG&type=tcp&headerType=none&host=$BUG#$user@IanVPN
vless://$uuid@$domain:$xtls?encryption=none&security=xtls&sni=$BUG&type=ws&host=$BUG&path=/xrayws#$user@IanVPN
trojan://$uuid@$domain:$xtls?sni=$BUG#$user@IanVPN
${vmesslink1}
EOF

# // User Info
echo ${base64Result} >"/etc/rare/config-url/${uuid}"
systemctl restart xray.service
sleep 2
clear

echo -e "================================="
echo -e "        XRAY VLESS XTLS         "
echo -e "================================="
echo -e "Remarks        : ${user}"
echo -e "IP/Host        : ${IP}"
echo -e "Domain         : ${domain}"
echo -e "Subdomain      : ${dom}"
echo -e "Sni/Bug        : ${sni}"
echo -e "port TCP-XTLS  : $xtls"
echo -e "id             : ${uuid}"
echo -e "================================="
echo -e "Direct         : ${vd}"
echo -e "================================="
echo -e "Direct UDP     : ${vu}"
echo -e "================================="
echo -e "Splice         : ${vs}"
echo -e "================================="
echo -e "Splice         : ${vsu}"
echo -e "================================="
echo -e "Created        : $hariini"
echo -e "Expired On     : $exp"
echo -e "================================="
echo -e "ScriptMod By Manternet"
