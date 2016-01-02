FROM qnib/terminal

RUN curl -fsL https://gobuilder.me/get/github.com/ipfs/go-ipfs/cmd/ipfs/ipfs_release_linux-amd64.zip |bsdtar xf - -C /opt/ && \
    mv /opt/ipfs/ipfs /usr/local/bin && chmod +x /usr/local/bin/ipfs && rm -rf /opt/ipfs
ADD etc/supervisord.d/ipfs.ini /etc/supervisord.d/
RUN useradd ipfs 
VOLUME /data/ipfs/
ADD opt/qnib/ipfs/bin/start.sh /opt/qnib/ipfs/bin/
