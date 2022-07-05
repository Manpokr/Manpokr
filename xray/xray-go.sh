#!/bin/bash
# Xray Auto Setup 
# =========================
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[information]${Font_color_suffix}"
MYIP=$(wget -qO- ipinfo.io/ip);
clear
# // Bahan²
apt install iptables iptables-persistent -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y
ntpdate pool.ntp.org
apt -y install chrony
timedatectl set-ntp true
systemctl enable chronyd && systemctl restart chronyd
systemctl enable chrony && systemctl restart chrony
timedatectl set-timezone Asia/Kuala_Lumpur
chronyc sourcestats -v
chronyc tracking -v
date

# // Detect public IPv4 address and pre-fill for the user
# // Domain 
apt install unzip
domain=$(cat /etc/rare/xray/domain)

# // Uuid Service
uuid=$(cat /proc/sys/kernel/random/uuid)

# / / Ambil Xray Core Version Terbaru
#latest_version="$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"

# / / Installation Xray Core
#xraycore_link="https://github.com/XTLS/Xray-core/releases/download/v$latest_version/xray-linux-64.zip"

# / / Make Main Directory
#mkdir -p /usr/bin/xray
#mkdir -p /etc/xray

# / / Unzip Xray Linux 64
#cd `mktemp -d`
#curl -sL "$xraycore_link" -o xray.zip
#unzip -q xray.zip && rm -rf xray.zip
#mv xray /usr/local/bin/xray
#chmod +x /usr/local/bin/xray

# // INSTALL XRAY
wget -c -P /etc/rare/xray/ "https://github.com/XTLS/Xray-core/releases/download/v1.4.5/Xray-linux-64.zip"
unzip -o /etc/rare/xray/Xray-linux-64.zip -d /etc/rare/xray 
rm -rf /etc/rare/xray/Xray-linux-64.zip
chmod 655 /etc/rare/xray/xray

# // XRay boot service
cat <<EOF >/etc/systemd/system/xray.service
[Unit]
Description=Xray - A unified platform for anti-censorship
# Documentation=https://v2ray.com https://guide.v2fly.org
After=network.target nss-lookup.target
Wants=network-online.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_BIND_SERVICE CAP_NET_RAW
NoNewPrivileges=yes
ExecStart=/etc/rare/xray/xray run -confdir /etc/rare/xray/conf
Restart=on-failure
RestartPreventExitStatus=23


[Install]
WantedBy=multi-user.target
EOF

# // Add Json
systemctl daemon-reload
systemctl enable xray.service
rm -rf /etc/rare/xray/conf/*
cat <<EOF >/etc/rare/xray/conf/00_log.json
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "warning"
  }
}
EOF
cat <<EOF >/etc/rare/xray/conf/10_ipv4_outbounds.json
{
    "outbounds":[
        {
            "protocol":"freedom",
            "settings":{
                "domainStrategy":"UseIPv4"
            },
            "tag":"IPv4-out"
        },
        {
            "protocol":"freedom",
            "settings":{
                "domainStrategy":"UseIPv6"
            },
            "tag":"IPv6-out"
        },
        {
            "protocol":"blackhole",
            "tag":"blackhole-out"
        }
    ]
}
EOF
cat <<EOF >/etc/rare/xray/conf/11_dns.json
{
    "dns": {
        "servers": [
          "localhost"
        ]
  }
}
EOF
cat <<EOF >/etc/rare/xray/conf/02_VLESS_TCP_inbounds.json
{
  "inbounds": [
    {
      "port": 443,
      "protocol": "vless",
      "tag": "VLESSTCP",
      "settings": {
        "clients": [],
        "decryption": "none",
        "fallbacks": [
          {
            "dest": 31296,
            "xver": 1
          },
          {
            "alpn": "h2",
            "dest": 31302,
            "xver": 0
          },
          {
            "path": "/xrayws",
            "dest": 31297,
            "xver": 1
          },
          {
            "path": "/xrayvws",
            "dest": 31299,
            "xver": 1
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "xtls",
        "xtlsSettings": {
          "minVersion": "1.2",
          "alpn": [
            "http/1.1",
            "h2"
          ],
          "certificates": [
            {
              "certificateFile": "/etc/rare/xray/xray.crt",
              "keyFile": "/etc/rare/xray/xray.key",
              "ocspStapling": 3600,
              "usage": "encipherment"
            }
          ]
        }
      }
    }
  ]
}
EOF
cat <<EOF >/etc/rare/xray/conf/03_VLESS_WS_inbounds.json
{
  "inbounds": [
    {
      "port": 31297,
      "listen": "127.0.0.1",
      "protocol": "vless",
      "tag": "VLESSWS",
      "settings": {
        "clients": [],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "security": "none",
        "wsSettings": {
          "acceptProxyProtocol": true,
          "path": "/xrayws"
        }
      }
    }
  ]
}
EOF
cat <<EOF >/etc/rare/xray/conf/04_trojan_gRPC_inbounds.json
{
    "inbounds": [
        {
            "port": 31304,
            "listen": "127.0.0.1",
            "protocol": "trojan",
            "tag": "trojangRPCTCP",
            "settings": {
                "clients": [
                    {
                        "password": "9dcc73ba-c90a-4de9-be35-be3da0129768",
                        "email": "xmy01.vpnshopee.xyz_trojan_gRPC"
                    }
                ],
                "fallbacks": [
                    {
                        "dest": "31300"
                    }
                ]
            },
            "streamSettings": {
                "network": "grpc",
                "grpcSettings": {
                    "serviceName": "xraytrojangrpc"
                }
            }
        }
    ]
}
EOF
cat <<EOF >/etc/rare/xray/conf/04_trojan_TCP_inbounds.json
{
  "inbounds": [
    {
      "port": 31296,
      "listen": "127.0.0.1",
      "protocol": "trojan",
      "tag": "trojanTCP",
      "settings": {
        "clients": [],
        "fallbacks": [
          {
            "dest": "31300"
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "none",
        "tcpSettings": {
          "acceptProxyProtocol": true
        }
      }
    }
  ]
}
EOF
cat <<EOF >/etc/rare/xray/conf/05_VMess_WS_inbounds.json
{
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "port": 31299,
      "protocol": "vmess",
      "tag": "VMessWS",
      "settings": {
        "clients": []
      },
      "streamSettings": {
        "network": "ws",
        "security": "none",
        "wsSettings": {
          "acceptProxyProtocol": true,
          "path": "/xrayvws"
        }
      }
    }
  ]
}
EOF
cat <<EOF >/etc/rare/xray/conf/06_VLESS_gRPC_inbounds.json
{
    "inbounds":[
    {
        "port": 31301,
        "listen": "127.0.0.1",
        "protocol": "vless",
        "tag":"VLESSGRPC",
        "settings": {
            "clients": [],
            "decryption": "none"
        },
        "streamSettings": {
            "network": "grpc",
            "grpcSettings": {
                "serviceName": "xraygrpc"
            }
        }
    }
]
}
EOF

# // IpTables
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 31301 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 31299 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 31296 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 31304 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 31297 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT

# // IpTables
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 31301 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 31299 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 31296 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 31304 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 31297 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 443 -j ACCEPT
iptables-save >/etc/iptables.rules.v4
netfilter-persistent save
netfilter-persistent reload
systemctl daemon-reload

# // Restart Xray
systemctl daemon-reload
systemctl restart xray
systemctl enable xray
systemctl restart xray.service
systemctl enable xray.service
systemctl restart nginx
systemctl restart xray


# // Download File
cd /usr/bin
wget -O xray-menu "https://raw.githubusercontent.com/Manpokr/Manpokr/main/xray/xray-menu.sh"
wget -O xp "https://raw.githubusercontent.com/Manpokr/Manpokr/main/xray/xray-xp.sh"
wget -O addtrgrpc "https://raw.githubusercontent.com/Manpokr/Manpokr/main/add/addtrojangrpc.sh"
wget -O addtrxtls "https://raw.githubusercontent.com/Manpokr/Manpokr/main/add/addtrxtls.sh"
wget -O addxtls "https://raw.githubusercontent.com/Manpokr/Manpokr/main/add/addxtls.sh"
wget -O addxtrojan "https://raw.githubusercontent.com/Manpokr/Manpokr/main/add/addxtrojan.sh"
wget -O addxvless "https://raw.githubusercontent.com/Manpokr/Manpokr/main/add/addxvless.sh"
wget -O addxv2ray "https://raw.githubusercontent.com/Manpokr/Manpokr/main/add/addxv2ray.sh"
wget -O menu-xray "https://raw.githubusercontent.com/Manpokr/Manpokr/main/menu/menu-xray.sh"
wget -O menu "https://raw.githubusercontent.com/Manpokr/Manpokr/main/menu/menu"
wget -O certv2ray "https://raw.githubusercontent.com/Manpokr/Manpokr/main/addon/certv2ray.sh"

# // Del
wget -O deltrxtls "https://raw.githubusercontent.com/Manpokr/Manpokr/main/del/deltrxtls.sh"
wget -O deltrgrpc "https://raw.githubusercontent.com/Manpokr/Manpokr/main/del/deltrgrpc.sh"
wget -O delxtls "https://raw.githubusercontent.com/Manpokr/Manpokr/main/del/delxtls.sh"
wget -O delxtrojan "https://raw.githubusercontent.com/Manpokr/Manpokr/main/del/delxtrojan.sh"
wget -O delxvless "https://raw.githubusercontent.com/Manpokr/Manpokr/main/del/delxvless.sh"
wget -O delxv2ray "https://raw.githubusercontent.com/Manpokr/Manpokr/main/del/delxv2ray.sh"

chmod +x xray-menu
chmod +x xp
chmod +x addtrgrpc
chmod +x addtrxtls
chmod +x addxtls
chmod +x addxtrojan
chmod +x addxvless
chmod +x addxv2ray
chmod +x deltrxtls
chmod +x deltrgrpc
chmod +x delxtls
chmod +x delxtrojan
chmod +x delxvless
chmod +x delxv2ray
chmod +x menu-xray
chmod +x menu
chmod +x certv2ray

cd

echo -e "done"
clear
