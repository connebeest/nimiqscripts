#!/bin/bash
# Easy Setup Script for NodeJS Nimiq Miner


#Get Settings

echo 'Using NimiqPool.com'
usePool="--pool=node.nimiqpool.com:8444"

echo 'Using Mainnet'
echo 'Using mine.sh'
nimiqScript="mine.sh"




echo 'Please enter the number of Miningthreads: '
read nimiqThreads




echo 'Enter Wallet Address (NOT SEED): '
read nimiqAddress

echo 'Enter Extra-Data Field (Optional,Useful for multiple miners on the same Address): '
read nimiqExtra


#Required Setup
sudo apt-get update
sudo apt-get -y upgrade

#Install requirements
sudo apt-get install -y curl git build-essential python

#Setup NodeJS
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo npm install -g yarn
yarn global add gulp

git clone https://github.com/nimiq-network/core


nimiqDoD="--dumb"


#Generate Mining Runscript
touch $nimiqScript
chmod +x $nimiqScript

echo "cd core && git pull && yarn " > $nimiqScript 

echo "cd clients/nodejs/" >> $nimiqScript 

echo "env UV_THREADPOOL_SIZE=$nimiqThreads node index.js $usePool --wallet-address=\"$nimiqAddress\" --miner=$nimiqThreads --statistics=10 $nimiqDoD --extra-data=\"$nimiqExtra\"" >> $nimiqScript
