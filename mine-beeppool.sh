hostname="UK-P5000-$RANDOM"
threads="$(grep processor /proc/cpuinfo | wc -l)"
echo "Starting miner"
export UV_THREADPOOL_SIZE="$threads"
cd ~/linux-skylake-avx512
./miner --wallet-address="NQ52 2N1A 16S5 1VXG 756D YTPB HFPC TEFU RU75" --miner="$threads" --extra-data="$hostname"
