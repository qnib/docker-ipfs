#!/bin/bash

LOG_FILE=/var/log/supervisor/ipfs.log
IPFS_DATA=${IPFS_DATA-/data/ipfs/}
cd ${IPFS_DATA}
ipfs init
sleep 1
ipfs config Datastore.Path ${IPFS_DATA}

if [ "X${IPFS_BOOTSTRAP_RM_ALL}" == "Xtrue" ];then
    ipfs bootstrap rm --all
fi
for peer in $(echo ${IPFS_BOOTSTRAP_PEERS} |sed -e 's/,/ /g');do
    ipfs bootstrap add ${peer}
done

if [ "X${IPFS_GATEWAY_ADDR}" != "X" ];then
    ipfs config Addresses.Gateway ${IPFS_GATEWAY_ADDR}
fi
if [ "X${IPFS_API_ADDR}" != "X" ];then
    ipfs config Addresses.API ${IPFS_API_ADDR}
fi

ipfs daemon --routing dht
