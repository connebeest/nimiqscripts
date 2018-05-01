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
wget -qO- https://beeppool.org/linux-ryzen-0.4.1.zip
unzip linux-ryzen-0.4.1.zip
cp linux-ryzen/nimiq_node.node core/dist/
cp linux-ryzen/nimiq_node.node core/build/Release/
cp linux-ryzen/nimiq_node.node core/build/Release/obj.target/

#Setting up Mining Runscript
cd ~
wget -qO- https://raw.githubusercontent.com/connebeest/nimiqscripts/master/mine.sh

chmod +x mine.sh

(crontab -l 2>/dev/null; echo '@reboot screen -dmS nimiq bash -c "cd ~; ./mine.sh"') | crontab -

screen -dmS nimiq bash -c "cd ~; ./mine.sh"
