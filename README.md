# APEX-Mainnet-Node

![alt-text](https://miro.medium.com/max/700/1*vOakjXvG44Kgsou8E9zRQw.png)

### Operating System
Ubuntu 18.04 LTS

### 1. Clone the repo
```console
git clone https://github.com/yuomii/APEX-Mainnet-Node.git
```

### 2. Change directory
```console
cd APEX-Mainnet-Node
```

### 3. Make all provided scripts executable
```console
chmod +x install.sh
```
```console
chmod +x configure.sh
```
```console
chmod +x run.sh
```
```console
chmod +x client.sh
```
```console
chmod +x firewall.sh
```

### 4. Then install the core and the client application
```console
sudo sh install.sh
```

### 5. Configure your settings for the Mainnet
#### You must provide the following parameters for a successfull setup
* (-h) Your public server IP 
```console
 -h 81.92.144.2
 ```
* (-k) Your miner private key in RAW Format
```console
-k 7a93d447bffe6d89e690f529a3a0bdff8ff6169172458e04849ef1d4eafd7f86
```
* (-t) The timestamp for the genesis block
```console
-t 2019-05-18T09:05:00Z
```
* (-p1) IP of your first peer node to connect to
```console
-p1 71.111.91.7
```
* (-p2) IP of your second peer node to connect to
```console
-p2 72.121.61.1
```
* (-p3) IP of your third peer node to connect to
```console
-p3 66.92.41.11
```
* (-n) The name of your node
```console
-n MyFancyNode
```
**Run the script**
```console
sh configure.sh -h "your-public-ip" -k "your-producer-key" -t "timestamp" 
-p1 "peer-ip-1" -p2 "peer-ip-2" -p3 "peer-ip-3" -n "your-node-name"
```

#### 6. Run the Core (Supernode)
```console
sh run.sh
```

#### 7. Run the Client (Wallet)
```console
sh client.sh
```
**For client command documentation take a look at [Client Docs](https://github.com/APEX-Network/APEX-Blockchain-CLI/blob/dev/CLI%20commands.md)**

#### 8. Enable the firewall
```console
sh firewall.sh
```

# Relevant Information
If you did generate your miner key over the tracker you will need to convert it from WIF-Format to RAW
* WIF looks like that:
> KxP3w2eTciGTGhNj4FtHvaKD1TVUS4P2pSTLrQx2BLTkzjekFKkp

* Raw looks like that:
> 7a93d447bffe6d89e690f529a3a0bdff8ff6169172458e04849ef1d4eafd7f86

Therefore you need to run the client application which can convert your key for you.

After you started the client enter this command for conversion:
```console
chain key -input "your-priv-key"
```
