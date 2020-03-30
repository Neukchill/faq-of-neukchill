#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#=================================================
#	Vnet-Tunnel一键安装脚本（Debian）
#	Version: 1.1
#	Author: NeukChill
#   关闭端口命令有时间再写，先咕咕咕
#=================================================
sh_ver="1.3.2"
github="gitee.com/yunyiya/Linux-NetSpeed/raw/master"

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
address="${Green_font_prefix}[管理地址]${Font_color_suffix}"
yunyi_end="重启服务器会导致数据丢失，为了稳定运行请尽可能保证服务器稳定。
执行${Green_font_prefix}vnet${Font_color_suffix}命令会再次启动此脚本"
yunyiya="www.yunyiya.com" 

#开始菜单
start_menu(){
  clear
echo && echo -e " Vnet隧道一键安装脚本
 NeukChill | For Debian  
  
————————————请选择安装类型————————————
 ${Green_font_prefix}1.${Font_color_suffix} 安装控制端(普通机器)
 ${Green_font_prefix}2.${Font_color_suffix} 安装控制端(NAT机器) 
 ${Green_font_prefix}3.${Font_color_suffix} 安装服务端
————————————其他功能/杂项————————————
 ${Green_font_prefix}4.${Font_color_suffix} 重启控制端
 ${Green_font_prefix}5.${Font_color_suffix} 重启服务端
 ${Green_font_prefix}6.${Font_color_suffix} 安装一键关闭端口命令(无效)
 ${Green_font_prefix}9.${Font_color_suffix} 退出脚本
————————————————————————————————" && echo

	
echo
read -p " 请输入数字 [1-9]:" num
case "$num" in
	1)
	check_sys_clinet
	;;
	2)
	check_sys_natclinet
	;;
	3)
	install_server
	;;
	4)
	chongqi_client
	;;
	5)
	chongqi_server
	;;
	6)
	startshenmene
	;;
	9)
	exit 1
	;;
	*)
	clear
	echo -e "${Error}:请输入正确数字 [1-9]"
	sleep 5s
	start_menu
	;;
esac
}

#安装普通控制端
check_sys_clinet(){
	suidaoanquan
    wget -N --no-check-certificate "https://${yunyiya}/download/linux/tunnel.zip" 
	unzip tunnel.zip
	chmod -R +x ./*
    nohup ./client >> /dev/null 2>&1 &
	echo "alias vnet=bash /root/vnet.sh" >> /root/.bashrc
	clear
    echo -e "控制端安装完成，请使用浏览器打开网址进行配置"
    echo -e ${address}
	echo -e ${Green_font_prefix}"http://${SERVER_IP}:8080/resources/add_client.html"${Font_color_suffix}
    echo -e $yunyi_end
}

#安装nat控制端
check_sys_natclinet(){
	echo;read -p "请设置管理端口(该端口将被占用):" portzhuanfa
    suidaoanquan
	iptables -t nat -A PREROUTING -p tcp --dport ${portzhuanfa} -j REDIRECT --to-port 8080
    wget -N --no-check-certificate "https://${yunyiya}/download/linux/tunnel.zip" 
	unzip tunnel.zip
	chmod -R +x ./*
    nohup ./client >> /dev/null 2>&1 &
	echo "alias vnet=bash /root/vnet.sh" >> /root/.bashrc
	clear
    echo -e "控制端安装完成，请使用浏览器打开网址进行配置"
	echo -e ${address}
    echo -e ${Green_font_prefix}"http://${SERVER_IP}:${portzhuanfa}/resources/add_client.html"${Font_color_suffix}
	echo -e $yunyi_end
}

#安装服务端
install_server(){
	suidaoanquan
    wget -N --no-check-certificate "https://${yunyiya}/download/linux/tunnel.zip" && unzip tunnel.zip && chmod -R +x ./*
    nohup ./server >> /dev/null 2>&1 &
	echo "alias vnet=bash /root/vnet.sh" >> /root/.bashrc
	clear
	echo -e "服务端安装完成，请使用浏览器打开网址进行配置"
	echo -e ${address}
    echo -e ${Green_font_prefix}"http://${SERVER_IP}:8081/resources/add_server.html"${Font_color_suffix}
	echo -e $yunyi_end
}

#重启客户端
chongqi_client(){
    cd /root
    killall client
    nohup ./client >> /dev/null 2>&1 &
}

#重启服务端
chongqi_server(){
    cd /root
    killall server
	nohup ./server >> /dev/null 2>&1 &
}
#防火墙和必要组件
suidaoanquan(){
    systemctl stop firewalld
    systemctl mask firewalld
	apt install -y iptables
    apt install iptables-services -y
	iptables -F
    iptables -P INPUT ACCEPT
    iptables -X
	echo -e "防火墙设置完成"
	apt -y install zip unzip
    cd /root/
    rm -rf /root/client
    rm -rf /root/resources
    rm -rf /root/server
    rm -rf /root/tunnel.zip
}

#获取服务器IP
rm -rf /root/.ip.txt
curl -s 'ifconfig.me' > /root/.ip.txt
SERVER_IP=`sed -n '1p' /root/.ip.txt`
#这里开始
cd /root/
start_menu
