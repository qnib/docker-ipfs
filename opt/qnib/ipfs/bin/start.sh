#!/bin/bash 

LOG_FILE=/var/log/supervisor/ipfs.log
#### REDIRECT LOG
# Close STDOUT file descriptor
exec 1<&-
# Close STDERR FD
exec 2<&-
# Open STDOUT as $LOG_FILE file for read and write.
exec 1<>$LOG_FILE
exec 2>&1

export IPFS_LOGGING=debug 
IPFS_DATA=${IPFS_DATA-/data/}
cd ${IPFS_DATA}
ipfs init

sleep 1
ipfs bootstrap rm --all

# smart to open it up so bad...?
ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080 
ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001
ipfs config SupernodeRouting.Servers --json "[]"
ipfs config Datastore.Path /data/ipfs/

ipfs daemon --routing dht
