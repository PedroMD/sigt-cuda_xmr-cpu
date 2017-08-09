#!/bin/sh -x

#eth_pool=$1
sigt_pool=$1
sigt_user=$2
sigt_pw=$3


sysctl -w vm.nr_hugepages=128

/xmr-stak-cpu/bin/xmr-stak-cpu /xmr-stak-cpu/bin/config.txt &
#/cpp-ethereum/build/ethminer/ethminer -U -F $eth_pool --farm-recheck 400
/ccminer/ccminer -a skunk -o $sigt_pool -u $sigt_user -p $sigt_pw
