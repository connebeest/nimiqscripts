hostname="$(hostname)"
threads="$(grep processor /proc/cpuinfo | wc -l)"
cd core
uptodate="$(git pull)"
if [ "$uptodate" != "Already up-to-date." ]
then
        echo "Git was not up-to-date, running yarn"
        yarn
fi
echo "Git is up-to-date, not running yarn"
cd clients/nodejs/
echo "Starting miner"
env UV_THREADPOOL_SIZE="$threads" node index.js --pool=node.nimiqpool.com:8444 --type=full --wallet-address="NQ85 CEHL M7VU VUF6 5TD4 E4D6 5UN8 77L9 SJU7" --miner="$threads" --statistics=10 --dumb --extra-data="$hostname"
