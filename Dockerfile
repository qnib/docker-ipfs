FROM qnib/terminal

RUN yum install -y bsdtar && \
    curl -fsL https://gobuilder.me/get/github.com/ipfs/go-ipfs/cmd/ipfs/ipfs_release_linux-amd64.zip |bsdtar xf - -C /opt/
RUN mv /opt/ipfs/ipfs /usr/local/bin && chmod +x /usr/local/bin/ipfs && rm -rf /opt/ipfs
WORKDIR /data/
ADD opt/qnib/ipfs/bin/start.sh /opt/qnib/ipfs/bin/
ADD etc/supervisord.d/ipfs.ini /etc/supervisord.d/
RUN useradd ipfs 

