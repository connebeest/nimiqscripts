#!/bin/bash
# Easy Setup Script for NodeJS Nimiq Miner

#killall screen

#Required Setup
#sudo apt-get update
#sudo apt-get -y upgrade

#Install requirements
#sudo apt-get install -y curl git build-essential python

#Setup NodeJS
#curl -sL https://deb.nodesource.com/setup_9.x -o nodesource_setup.sh
#sudo bash nodesource_setup.sh
#sudo apt-get install -y nodejs

#sudo npm install -g gulp
#sudo npm install -g yarn

#git clone https://github.com/nimiq-network/core

#cd core 
#yarn

#pacman -Sy
#pacman -Sy unzip screen
yum -y install screen unzip
#cd ~
#wget https://beeppool.org/linux-ryzen-0.4.1.zip
#wget https://miner.beeppool.org/downloads/beepminer-0.3.3.zip
wget --no-check-certificate https://beeppool.org/downloads/linux-skylake-avx512-0.5-beta.zip
unzip linux-skylake-avx512-0.5-beta.zip
#wget https://miner.beeppool.org/downloads/beepminer-0.3.4.zip
#unzip beepminer-0.3.4.zip
#cp linux-ryzen/nimiq_node.node core/dist/
#cp linux-ryzen/nimiq_node.node core/build/Release/
#cp linux-ryzen/nimiq_node.node core/build/Release/obj.target/

#Setting up Mining Runscript
cd ~
#wget https://raw.githubusercontent.com/connebeest/nimiqscripts/master/mine.sh
wget https://raw.githubusercontent.com/connebeest/nimiqscripts/master/mine-beeppool.sh

chmod +x mine-beeppool.sh
#chmod +x mine.sh

#scp -r root@srv83003.dus2.fastwebserver.de:/root/core/clients/nodejs/main-full-consensus /root/core/clients/nodejs/

#killall screen

#Chosing pool
#echo "1 for Nimiqpool, 2 for Beeppool: "
#read poolchoice

#if [ "$poolchoice" == "1" ]
#then
#echo "You chose Nimiqpool"
#screen -dmS nimiq bash -c "cd ~; ./mine.sh"
#fi
#if [ "$poolchoice" == "2" ]
#then
#echo "You chose Beeppool"
screen -dmS nimiq bash -c "cd ~; ./mine-beeppool.sh"
#fi

screen -r
