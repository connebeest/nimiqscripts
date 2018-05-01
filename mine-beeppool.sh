hostname="$(hostname)"
threads="$(grep processor /proc/cpuinfo | wc -l)"
echo "Starting miner"
export UV_THREADPOOL_SIZE="$threads"
cd ~/linux-ryzen
./miner --wallet-address="NQ85 CEHL M7VU VUF6 5TD4 E4D6 5UN8 77L9 SJU7" --miner="$threads" --extra-data="$hostname"
