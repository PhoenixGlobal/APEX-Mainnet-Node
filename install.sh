#!/bin/bash
echo "Install Git"
sudo apt-get install git -y
echo "Add java repo"
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get install unzip
sudo apt-get update
echo "Install java"
sudo apt install oracle-java8-installer -y
echo "Get gradle binary"
wget https://services.gradle.org/distributions/gradle-4.10.2-bin.zip
echo "Install gradle"
rm -r ~/gradle
unzip -d ~/gradle gradle-4.10.2-bin.zip
rm gradle-4.10.2-bin.zip
echo "Clone APEX Core"
git clone https://github.com/APEX-Network/APEX-Blockchain-Core.git
cd APEX-Blockchain-Core
git checkout v0.9.1
echo "Build Core"
~/gradle/gradle-4.10.2/bin/gradle shadowJar
cd ..
cp APEX-Blockchain-Core/build/libs/APEX-Blockchain-Core-0.9.1.jar apex-blockchain-core.jar
mkdir test_net
