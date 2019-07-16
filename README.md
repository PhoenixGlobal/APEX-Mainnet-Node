<p align="center">
  <img src="https://miro.medium.com/max/700/1*ISLOhsfWNQ6zMRg-vvSX0g.png">
</p>

### Operating System
Ubuntu 18.04 LTS

### 1. Install git
```console
sudo apt install git -y
```

### 2. Clone the repo
```console
git clone https://github.com/yuomii/APEX-Mainnet-Node.git
```

### 3. Change directory
```console
cd APEX-Mainnet-Node
```

### 4. Make all provided scripts executable
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

### 5. Then install the core and the client application
```console
sudo sh install.sh
```

### 6. Configure your settings for the Mainnet
#### You must provide the following parameters for a successfull setup
* -h Your public server IP 
```console
 -h 81.92.144.2
 ```
* -k Your miner private key in RAW Format
```console
-k 7a93d447bffe6d89e690f529a3a0bdff8ff6169172458e04849ef1d4eafd7f86
```
* -t The timestamp for the genesis block
```console
-t 2019-05-18T09:05:00Z
```
* -a IP of your first peer node to connect to
```console
-a 71.111.91.7
```
* -b IP of your second peer node to connect to
```console
-b 72.121.61.1
```
* -c IP of your third peer node to connect to
```console
-c 66.92.41.11
```
* -n The name of your node
```console
-n MyFancyNode
```
**Run the script**
```console
sh configure.sh -h "your-public-ip" -k "your-producer-key" -t "timestamp" 
-a "peer-ip-1" -b "peer-ip-2" -c "peer-ip-3" -n "your-node-name"
```
**Using the example values above it would be**
```console
sh configure.sh -h 81.92.144.2 -k 7a93d447bffe6d89e690f529a3a0bdff8ff6169172458e04849ef1d4eafd7f86 
-t 2019-05-18T09:05:00Z -a 71.111.91.7 -b 72.121.61.1 -c 66.92.41.11 -n MyFancyNode
```

### 7. Run the core (Supernode)
```console
sh run.sh
```

### 8. Run the client (Wallet)
```console
sh client.sh
```

### 9. Enable the firewall
```console
sudo sh firewall.sh
```

# Relevant Information

### 1. Client command documentation
For client command documentation take a look at **[Client Docs](https://github.com/APEX-Network/APEX-Blockchain-CLI/blob/dev/CLI%20commands.md)**

### 2. Conversion of private keys
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

### 3. Register your producer node
After you are in sync with the chain you can start with block production. Therefore you must register your node in the network.

The registration can be done with the CLI. For the commands needed take a look at **[Client Docs](https://github.com/APEX-Network/APEX-Blockchain-CLI/blob/dev/CLI%20commands.md)** | Section 7.1

If the registration broadcast was successfull you will be able to vote for your node in the **[Tracker](https://tracker.apexnetwork.io)**

### 4. Running core and client parallel
In order to run multiple applications or keep one application running after exiting the SSH session you need a program that enables you to have multiple terminal instances on your machine. Screen is a good starting point:  **[Screen Tutorial](https://linuxize.com/post/how-to-use-linux-screen)**

### 5. Securing your server
If you are a newbie you should probably learn how to keep your server secure. 

This is a good starting point: **[Securing your Server](https://docs.ovh.com/gb/en/vps/tips-for-securing-a-vps)**
