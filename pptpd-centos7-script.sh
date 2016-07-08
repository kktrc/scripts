
#update
yum -y update

yum -y install ppp iptables pptpd iptables-services

systemctl enable iptables
systemctl start iptables

systemctl enable pptpd
systemctl start pptpd

systemctl stop firewalld.service
systemctl disable firewalld.service
yum -y erase firewalld

# /etc/sysctl.conf
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p # 使内核转发生效

# /etc/ppp/chap-secrets
user=moshenglei
pass=123456
echo "${user} pptpd ${pass} *" >> /etc/ppp/chap-secrets

# /etc/pptpd.conf
echo "localip 192.168.0.1" >> /etc/pptpd.conf
echo "remoteip 192.168.0.234-238,192.168.0.245" >> /etc/pptpd.conf

# /etc/ppp/options.pptpd
echo "ms-dns 8.8.8.8" >> /etc/ppp/options.pptpd
echo "ms-dns 8.8.4.4" >> /etc/ppp/options.pptpd

cat>/etc/sysconfig/iptables<<EOF
*nat
:PREROUTING ACCEPT [2:104]
:INPUT ACCEPT [2:104]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE
COMMIT

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [6:406]
:OUTPUT ACCEPT [6:568]
-A INPUT -p tcp -m tcp --dport 8888 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 1723 -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p gre -j ACCEPT
-A FORWARD -s 192.168.0.0/24 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j TCPMSS --set-mss 1356
-A OUTPUT -p gre -j ACCEPT
COMMIT
EOF

systemctl restart iptables
systemctl restart pptpd

chkconfig pptpd on

echo "VPN service is installed, your VPN username is ${user}, VPN password is ${pass}"
