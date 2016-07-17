FROM qnib/terminal

RUN wget -qO /usr/local/bin/ipfs https://github.com/qnib/go-ipfs/releases/download/0.4.3-dev/ipfs-0.4.3-dev-x86 \
 && chmod +x /usr/local/bin/ipfs
ADD etc/supervisord.d/ipfs.ini /etc/supervisord.d/
RUN useradd ipfs 
VOLUME /data/ipfs/
ADD opt/qnib/ipfs/bin/start.sh /opt/qnib/ipfs/bin/
