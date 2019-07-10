## APEX-Mainnet-Node
Producer node setup script for the APEX Mainnet

#### Operating System
Ubuntu 18.04 LTS

#### How-to
#### 1. Clone the repo

> git clone https://github.com/yuomii/APEX-Testnet-Node.git

#### 2. Change directory

> cd APEX-Testnet-Node 

#### 3. Make all provided scripts executable
```console
 chmod +x install.sh
 chmod +x configure.sh
 chmod +x run.sh
 chmod +x client.sh
 chmod +x firewall.sh
```
#### 4. Then install the core and the client application
> sh install.sh

#### 5. Configure your settings for the Mainnet
#### You must provide the following parameters for a successfull setup
* (-h) Your public server IP 
> -h 81.92.144.2

* (-k) Your miner private key in RAW Format
> -k 7a93d447bffe6d89e690f529a3a0bdff8ff6169172458e04849ef1d4eafd7f86

* (-t) The timestamp for the genesis block
> -t 2019-05-18T09:05:00Z

* (-p1) IP of your first peer node to connect to
> -p1 71.111.91.7

* (-p2) IP of your second peer node to connect to
> -p1 72.121.61.1

* (-p3) IP of your third peer node to connect to
> -p1 66.92.41.11

* (-n) The name of your node
> -n MyFancyNode

> sh configure.sh -h "your-public-ip" -k "your-producer-key" -t "timestamp"
  -p1 "peer-ip-1" -p2 "peer-ip-2" -p3 "peer-ip-3" -n "your-node-name"


#### 6. Run the Core (Supernode)
> sh run.sh

#### 7. Run the Client (Wallet)
> sh client.sh

**For client command documentation take a look at [Client Docs](https://github.com/APEX-Network/APEX-Blockchain-CLI/blob/dev/CLI%20commands.md)**

#### 8. Enable the firewall
> sh firewall.sh

