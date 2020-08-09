clear
 #!/bin/bash
 echo "------------------------START Miner----------------------"
 ./nq-miner-linux-0.99.7/nq-miner -t cuda -a "NQ52 2N1A 16S5 1VXG 756D YTPB HFPC TEFU RU75" -n "$HOSTNAME" -p pool.acemining.co:8443
 echo "------------------------END Miner----------------------"
 echo "Something went wrong or you exited"
