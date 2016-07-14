FROM qnib/terminal

RUN yum install -y bsdtar 
ENV IPFS_VER=v0.3.11
RUN curl -fsL https://gobuilder.me/get/github.com/ipfs/go-ipfs/cmd/ipfs/ipfs_${IPFS_VER}_linux-amd64.zip |bsdtar xf - -C /opt/ && \
    mv /opt/ipfs/ipfs /usr/local/bin && chmod +x /usr/local/bin/ipfs && rm -rf /opt/ipfs
ADD etc/supervisord.d/ipfs.ini /etc/supervisord.d/
RUN useradd ipfs 
VOLUME /data/ipfs/
ADD opt/qnib/ipfs/bin/start.sh /opt/qnib/ipfs/bin/
