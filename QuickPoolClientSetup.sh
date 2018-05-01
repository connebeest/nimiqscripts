#!/bin/bash
# Easy Setup Script for NodeJS Nimiq Miner

#Get Settings

echo 'Using NimiqPool.com'
usePool="--pool=node.nimiqpool.com:8444"

echo 'Using Mainnet'
echo 'Using mine.sh'
nimiqScript="mine.sh"

echo 'Fetching numer of threads'
nimiqThreads="$(grep processor /proc/cpuinfo | wc -l)"

echo 'Setting wallet address'
nimiqAddress="NQ85 CEHL M7VU VUF6 5TD4 E4D6 5UN8 77L9 SJU7"

echo 'Fetching extra-date name'
nimiqExtra="$(hostname)"

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

nimiqDoD="--dumb"

#Generate Mining Runscript
touch $nimiqScript
chmod +x $nimiqScript

echo "cd core && git pull && yarn && yarn build" > $nimiqScript 

echo "cd clients/nodejs/" >> $nimiqScript 

echo "env UV_THREADPOOL_SIZE=$nimiqThreads node index.js $usePool --type=full --wallet-address=\"$nimiqAddress\" --miner=$nimiqThreads --statistics=10 $nimiqDoD --extra-data=\"$nimiqExtra\"" >> $nimiqScript

(crontab -l 2>/dev/null; echo '@reboot screen -dmS nimiq bash -c "cd /root; ./mine.sh"') | crontab -

screen -dmS nimiq bash -c "cd /root; ./mine.sh"
