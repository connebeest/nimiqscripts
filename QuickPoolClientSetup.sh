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
yarn build

#Setting up Mining Runscript
cd ~
wget -qO- https://raw.githubusercontent.com/connebeest/nimiqscripts/master/mine.sh

chmod +x mine.sh

(crontab -l 2>/dev/null; echo '@reboot screen -dmS nimiq bash -c "cd ~; ./mine.sh"') | crontab -

screen -dmS nimiq bash -c "cd ~; ./mine.sh"
