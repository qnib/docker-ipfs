FROM qnib/terminal

RUN yum install -y bsdtar && \
    export IPFS_VER=v0.3.5 && \
    curl -fsL https://gobuilder.me/get/github.com/ipfs/go-ipfs/cmd/ipfs/ipfs_${IPFS_VER}_linux-amd64.zip |bsdtar xf - -C /opt/ && \
    mv /opt/ipfs/ipfs /usr/local/bin && chmod +x /usr/local/bin/ipfs && rm -rf /opt/ipfs
WORKDIR /data/
ADD opt/qnib/ipfs/bin/start_ipfs.sh /opt/qnib/ipfs/bin/
ADD etc/supervisord.d/ipfs.ini /etc/supervisord.d/
RUN useradd ipfs 
