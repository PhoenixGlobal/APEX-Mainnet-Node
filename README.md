# APEX-Testnet-Node
(Non) validator node setup script for the community testnet

# OPS
Ubuntu

# How-to
Clone the repo:

> git clone https://github.com/yuomii/APEX-Testnet-Node.git

change dir:

> cd APEX-Testnet-Node 

Make all scripts executable:

> chmod +x install.sh

> chmod +x run.sh

> chmod +x client.sh

Then install the core and configure the settings:

> sh install.sh -h "your-public-ip" -k (optional) "your-producer-key"

Then run the core first afterwards the client (optional):

> sh run.sh

> sh client.sh
