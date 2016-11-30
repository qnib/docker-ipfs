#!/bin/bash

MY_IP=$(ip route |tail -n1 |awk '{print $NF}')
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

if [ "X${IPFS_BIND_IP}" != "X" ];then
    ipfs config Addresses.Gateway /ip4/${IPFS_BIND_IP}/tcp/${GATEWAY_PORT}
    ipfs config Addresses.API /ip4/${IPFS_BIND_IP}/tcp/${API_PORT}
else
    if [ "X${IPFS_GATEWAY_ADDR}" != "X" ];then
        ipfs config Addresses.Gateway /ip4/${IPFS_GATEWAY_ADDR}/tcp/${GATEWAY_PORT}
    else
        ipfs config Addresses.Gateway /ip4/${MY_IP}/tcp/${GATEWAY_PORT}
    fi
    if [ "X${IPFS_API_ADDR}" != "X" ];then
        ipfs config Addresses.API /ip4/${IPFS_API_ADDR}/tcp/${API_PORT}
    else
        ipfs config Addresses.API /ip4/${MY_IP}/tcp/${API_PORT}
    fi
fi

ipfs daemon --routing dht
