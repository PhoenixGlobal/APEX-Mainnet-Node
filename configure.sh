#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -h <your-host-ip> -k <your-private-key> -t <timestamp> -p1 <PeerIP1> -p2<PeerIP2> -p3<PeerIP3> -n<NodeName>"
   echo -h "\tYour public static external ip to bind to"
   echo -k "\tYour miner private key in RAW format"
   echo -t "\tThe timestamp of the genesis block"
   echo -p1 "IP of your first peer"
   echo -p2 "IP of your second peer"
   echo -p3 "IP of your third peer"
   echo -n "Your Node Name"
   exit 1
}

while getopts "h:k:t:p1:p2:p3:n" opt
do
   case "$opt" in
      h ) hostIp="$OPTARG" ;;
      k ) privKey="$OPTARG" ;;
      t ) timeStamp="$OPTARG" ;;
      p1 ) peer1="$OPTARG" ;;
      p2 ) peer2="$OPTARG" ;;
      p3 ) peer3="$OPTARG" ;;
      n ) name="$OPTARG" ;;
      ? ) helpFunction ;;
   esac
done

if [ -z "$hostIp" ]
then
   echo "You have to pass at least your external IP";
   helpFunction
fi
if [ -z "$privKey" ]
then
   echo "You have to pass your private key in uncompressed Format";
   helpFunction
fi
if [ -z "$timeStamp" ]
then
   echo "You have to pass the timestamp if the genesis block";
   helpFunction
fi
if [ -z "$peer1" ]
then
   echo "You have to pass the IP of your first peer node";
   helpFunction
fi
if [ -z "$peer2" ]
then
   echo "You have to pass the IP of your second peer node";
   helpFunction
fi
if [ -z "$peer3" ]
then
   echo "You have to pass the IP of your thirs peer node";
   helpFunction
fi
if [ -z "$name" ]
then
   echo "You have to pass a name for your node";
   helpFunction
fi

cp generator-settings.conf settings.conf
sed -i 's/PublicIp/'$hostIp'/g' settings.conf
sed -i 's/ProducerKey/'$privKey'/g' settings.conf
sed -i 's/TimeStamp/'$timeStamp'/g' settings.conf
sed -i 's/YourNodeName/'$name'/g' settings.conf
sed -i 's/Peer1/'$peer1'/g' settings.conf
sed -i 's/Peer2/'$peer2'/g' settings.conf
sed -i 's/Peer3/'$peer3'/g' settings.conf
