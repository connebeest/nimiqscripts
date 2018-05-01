#!/bin/bash
# Easy Setup Script for NodeJS Nimiq Miner

#Required Setup
sudo apt-get update
sudo apt-get -y upgrade

#Install requirements
sudo apt-get install -y curl git build-essential python

#Setup NodeJS
curl -sL https://deb.nodesource.com/setup_9.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs

sudo npm install -g gulp
sudo npm install -g yarn

git clone https://github.com/nimiq-network/core

cd core 
yarn

cd ~
wget https://beeppool.org/linux-ryzen-0.4.1.zip
unzip linux-ryzen-0.4.1.zip
cp linux-ryzen/nimiq_node.node core/dist/
cp linux-ryzen/nimiq_node.node core/build/Release/
cp linux-ryzen/nimiq_node.node core/build/Release/obj.target/

#Setting up Mining Runscript
cd ~
wget https://raw.githubusercontent.com/connebeest/nimiqscripts/master/mine.sh
wget https://raw.githubusercontent.com/connebeest/nimiqscripts/master/mine-beeppool.sh

chmod +x mine-beeppool.sh
chmod +x mine.sh

scp -r root@srv83003.dus2.fastwebserver.de:/root/core/clients/nodejs/main-full-consensus /root/core/clients/nodejs/

killall screen

screen -dmS nimiq bash -c "cd ~; ./mine.sh"

screen -r
