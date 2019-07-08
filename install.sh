#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -h host-ip -k private-key"
   echo -h "\tYour public static external ip to bind to"
   echo -k "\tIf you run a producer node you can pass your private key here"
   exit 1
}

while getopts "h:k:" opt
do
   case "$opt" in
      h ) hostIp="$OPTARG" ;;
      k ) privKey="$OPTARG" ;;
      ? ) helpFunction ;;
   esac
done

if [ -z "$hostIp" ]
then
   echo "You have to pass at least your external IP";
   helpFunction
fi

echo "Install Git"
sudo apt-get install git -y
echo "Add java repo"
apt-get install -y software-properties-common
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt-get update
sudo apt-get install unzip
echo "Install java"
sudo apt-get install adoptopenjdk-12-hotspot
echo "Get gradle binary"
wget https://services.gradle.org/distributions/gradle-4.10.2-bin.zip
echo "Install gradle"
sudo rm -r ~/gradle
unzip -d ~/gradle gradle-4.10.2-bin.zip
sudo rm gradle-4.10.2-bin.zip
echo "Clone APEX Core"
git clone https://github.com/APEX-Network/APEX-Blockchain-Core.git
cd APEX-Blockchain-Core
git checkout testnet1
git pull
echo "Build Core"
~/gradle/gradle-4.10.2/bin/gradle shadowJar
cd ..
cp APEX-Blockchain-Core/build/libs/APEX-Blockchain-Core-0.9.1.jar apex-blockchain-core.jar
mkdir test_net
echo "Clone APEX Client"
git clone https://github.com/APEX-Network/APEX-Blockchain-CLI.git
cd APEX-Blockchain-CLI
git checkout dev
git pull
mkdir libs
cd ..
cp apex-blockchain-core.jar APEX-Blockchain-CLI/libs/APEX-Blockchain-Core-0.9.1.jar
cd APEX-Blockchain-CLI
~/gradle/gradle-4.10.2/bin/gradle shadowJar
cd ..
cp APEX-Blockchain-CLI/build/libs/APEX-Blockchain-CLI-0.9.1.jar apex-blockchain-cli.jar

sed -i 's/your-public-static-ip/'$hostIp'/g' settings.conf
if [ -z "$privKey" ]
then
   sed -i 's/your-producer-key/ /g' settings.conf
else
   sed -i 's/your-producer-key/'$privKey'/g' settings.conf
fi
