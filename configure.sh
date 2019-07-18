#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -k <your-private-key> -t <timestamp> -a <PeerIP1> -b <PeerIP2> -n <NodeName>"
   echo -k "\tYour miner private key in RAW format"
   echo -t "\tThe timestamp of the genesis block"
   echo -a "IP of your first peer"
   echo -b "IP of your second peer"
   echo -n "Your Node Name"
   echo ""
   exit 1
}

while getopts "k:t:a:b:n:" opt
do
   case "$opt" in
      k ) privKey="$OPTARG" ;;
      t ) timeStamp="$OPTARG" ;;
      a ) peer1="$OPTARG" ;;
      b ) peer2="$OPTARG" ;;
      n ) name="$OPTARG" ;;
      ? ) helpFunction ;;
   esac
done

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
if [ -z "$name" ]
then
   echo "You have to pass a name for your node";
   helpFunction
fi

mkdir blockchain
cp generator-settings.conf settings.conf
sed -i 's/ProducerKey/'$privKey'/g' settings.conf
sed -i 's/TimeStamp/'$timeStamp'/g' settings.conf
sed -i 's/YourNodeName/'$name'/g' settings.conf
sed -i 's/Peer1/'$peer1'/g' settings.conf
sed -i 's/Peer2/'$peer2'/g' settings.conf
