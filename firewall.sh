#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -p <your-ssh-port>"
   echo -p "\tYour SSH service Port"
   echo ""
   exit 1
}

while getopts "p:" opt
do
   case "$opt" in
      p ) port="$OPTARG" ;;
      ? ) helpFunction ;;
   esac
done

if [ -z "$port" ]
then
   echo "You have to pass your SSH port";
   helpFunction
fi

sudo iptables -I INPUT 1 -p tcp --dport $port -j ACCEPT
sudo iptables -I INPUT 2 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -I INPUT 3 -p tcp --dport 9090 -j ACCEPT
sudo iptables -I INPUT 4 -p tcp --sport 9090 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -I INPUT 5 -s localhost -j ACCEPT
sudo iptables -I INPUT 6 -j DROP
echo "Configured Firewall with SSH service on port $port"
