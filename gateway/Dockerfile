# A minimal example of gateway
# use iptables to do snat.
# if a packet is forwarded without snat or 
# other kinds of modification of src IP,
# it will loop till forever.
FROM debian:11-slim

RUN apt update && apt install -y iptables iputils-ping iproute2 tcpdump
WORKDIR /working
COPY run.sh run.sh
CMD ["/bin/sh", "run.sh"]
