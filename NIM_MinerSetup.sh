# Script Made By Albermonte
mkdir NimiqMiner
cd NimiqMiner
wget https://github.com/tomkha/nq-miner/releases/download/0.99.7/nq-miner-linux-0.99.7.tar.gz
mkdir nq-miner
tar -xzvf nq-miner-linux-0.99.7.tar.gz -C nq-miner
rm nq-miner-linux-0.99.7.tar.gz
rm ./nq-miner/start_gpu.sh
printf "clear \n #!/bin/bash \n echo \"------------------------START Miner----------------------\" \n ./nq-miner/nq-miner -t cuda -a \"NQ52 2N1A 16S5 1VXG 756D YTPB HFPC TEFU RU75\" -n \"NQ-Miner\" -p nimiq.icemining.ca:2053 \n echo \"------------------------END Miner----------------------\" \n echo \"Something went wrong or you exited\"" > start_gpu.sh
chmod +x start_gpu.sh
clear && printf "\n\n\n\n ############################################################## \n ######                                                  ###### \n ######  Go to NimiqMiner folder and open start_gpu.sh   ###### \n ######                                                  ###### \n ############################################################## \n\n\n\n Thanks \n\n\n"                                               ###### & echo ######  Go to NimiqMiner folder and open start_gpu.bat  ###### & echo ######                                                  ###### & echo ############################################################## & echo. & echo. & echo. & echo. & echo. & echo. & echo Thanks & echo. & echo. & echo. & PAUSE
