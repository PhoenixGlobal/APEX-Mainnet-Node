sudo iptables -I INPUT 1 -p tcp --dport 22 -j ACCEPT
sudo iptables -I INPUT 2 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
sudo iptables -I INPUT 3 -p tcp --dport 9090 -j ACCEPT
sudo iptables -I INPUT 4 -p tcp --sport 9090 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
sudo iptables -I INPUT 5 -s localhost -j ACCEPT
sudo iptables -I INPUT 6 -j DROP
