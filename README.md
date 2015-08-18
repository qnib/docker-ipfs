# docker-ipfs

Docker Image holding the IPFS peer2peer filesystem

## IPFS Hello World
Following the Tutorial on the [ipfs website](http://ipfs.io/docs/getting-started/) a hello world comes down to the following.

#### Start stack
```
$ docker-compose up -d
Creating dockeripfs_consul_1...
Creating dockeripfs_ipfs0_1...
Creating dockeripfs_ipfs1_1...
```

#### Init ipfs0
[root@ipfs0 /]# cd /data/
[root@ipfs0 data]# ipfs init
initializing ipfs node at /root/.ipfs
generating 2048-bit RSA keypair...done
peer identity: QmRBD3uQAbpokYhdAiacLoHPvFPM53CaFRGYMZLVagEQH2
to get started, enter:

	ipfs cat /ipfs/QmVtU7ths96fMgZ8YSZAbKghyieq7AjxNdcqyVzxTt3qVe/readme
[root@ipfs0 data]#   
