# APEX-Mainnet-Node
Producer node setup script for the APEX Mainnet

# Operating System
Ubuntu 18.04 LTS

# How-to
#####1. Clone the repo

> git clone https://github.com/yuomii/APEX-Testnet-Node.git

#####2. Change directory

> cd APEX-Testnet-Node 

#####3. Make all provided scripts executable

> chmod +x install.sh

> chmod +x run.sh

> chmod +x client.sh

> chmod +x firewall.sh

#####4. Then install the core and afterwards the client plus configure the settings
#####You must provide the following parameters for a successfull setup
* (-h) Your public server IP > Example: 81.92.144.2
* (-k) Your miner private key in RAW Format > Example: 7a93d447bffe6d89e690f529a3a0bdff8ff6169172458e04849ef1d4eafd7f86

> sh install.sh -h "your-public-ip" -k (optional) "your-producer-key"

Then run the core first afterwards the client (optional):

> sh run.sh

> sh client.sh
