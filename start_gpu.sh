clear
 #!/bin/bash
 echo "------------------------START Miner----------------------"
 ./nq-miner-linux-0.99.7/nq-miner -t cuda -a "NQ522N1A16S51VXG756DYTPBHFPCTEFURU75" -n "$HOSTNAME" -p pool.acemining.co:8443
 echo "------------------------END Miner----------------------"
 echo "Something went wrong or you exited"
