# faq-of-neukchill
開啟bbr加速<br>
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh<br>

大陸host加速github<br>
192.30.253.112 github.com<br>
192.30.253.113 github.com<br>
151.101.184.133 assets-cdn.github.com<br>
151.101.185.194 github.global.ssl.fastly.net<br>
151.101.72.133 raw.githubusercontent.com<br>

Debian更換大陸apt源<br>
cat  > /etc/apt/sources.list <<END<br>
deb http://mirrors.163.com/debian/ stretch main<br>
deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib<br>
deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib<br>
deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib<br>
deb http://httpredir.debian.org/debian stretch-backports main contrib non-free<br>
END<br>
apt-get clean all && apt-get update && apt-get upgrade<br>

安裝ca證書<br>
yum install -y ca-certificates<br>
apt-get install -y ca-certificates<br>


安裝Docker-ce
```
wget -qO- https://get.docker.com/ | bash;systemctl start docker;systemctl enable docker
```
安裝Docker-ce（大陸地區）


Vnet-Centos一鍵腳本<br>
```
yum -y install wget;mkdir vnet;cd /root/vnet;wget -N --no-check-certificate "https://www.yunyiya.com/download/linux/vnet.sh";chmod +x vnet.sh;./vnet.sh
```
VNet-Debian一鍵腳本
```
apt -y install curl;mkdir vnet;cd /root/vnet;curl https://raw.githubusercontent.com/Neukchill/faq-of-neukchill/master/vnet.sh -o vnet.sh;chmod +x vnet.sh;./vnet.sh
```
#禁用端口;解除禁用<br>
iptables -A INPUT -p tcp --dport 8081 -j DROP<br>
iptables -A INPUT -p tcp --dport 8080 -j DROP<br>
iptables -F<br>

一鍵測試伺服器到大陸的速度<br>
wget https://raw.githubusercontent.com/oooldking/script/master/superspeed.sh<br>
chmod +x superspeed.sh<br>
./superspeed.sh<br>

mkdir besttrace && cd besttrace
wget -N --no-check-certificate https://cdn.ipip.net/17mon/besttrace4linux.zip
unzip besttrace4linux.zip && chmod +x *
./besttrace -q 1 
