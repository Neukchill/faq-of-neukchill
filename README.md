# faq-of-neukchill
開啟bbr加速
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh

大陸host加速github
192.30.253.112 github.com
192.30.253.113 github.com
151.101.184.133 assets-cdn.github.com
151.101.185.194 github.global.ssl.fastly.net
151.101.72.133 raw.githubusercontent.com

Debian更換大陸apt源
cat  > /etc/apt/sources.list <<END
deb http://mirrors.163.com/debian/ stretch main
deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib
deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib
deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib
deb http://httpredir.debian.org/debian stretch-backports main contrib non-free
END
apt-get clean all && apt-get update && apt-get upgrade

安裝ca證書
yum install -y ca-certificates
apt-get install -y ca-certificates


安裝Docker-ce
wget -qO- https://get.docker.com/ | bash && systemctl start docker && systemctl enable docker
安裝Docker-ce（大陸地區）


Vnet-Centos一鍵腳本
yum -y install wget;mkdir vnet;cd /root/vnet;wget -N --no-check-certificate "https://www.yunyiya.com/download/linux/vnet.sh";chmod +x vnet.sh;./vnet.sh
VNet-Debian一鍵腳本
apt -y install curl;mkdir vnet;cd /root/vnet;curl https://raw.githubusercontent.com/Neukchill/faq-of-neukchill/master/vnet.sh -o vnet.sh;chmod +x vnet.sh;./vnet.sh
#禁用端口;解除禁用
iptables -A INPUT -p tcp --dport 8081 -j DROP
iptables -A INPUT -p tcp --dport 8080 -j DROP
iptables -F

一鍵測試伺服器到大陸的速度
wget https://raw.githubusercontent.com/oooldking/script/master/superspeed.sh
chmod +x superspeed.sh
./superspeed.sh