FROM qnib/terminal

RUN yum install -y bsdtar && \
    curl -fsL https://gobuilder.me/get/github.com/ipfs/go-ipfs/cmd/ipfs/ipfs_master_linux-amd64.zip |bsdtar xf - -C /opt/
RUN mv /opt/ipfs/ipfs /usr/local/bin && chmod +x /usr/local/bin/ipfs && rm -rf /opt/ipfs
WORKDIR /data/
RUN ipfs init && \
    ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080 && \
    ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001
CMD ["ipfs", "daemon"]
