FROM debian:11-slim

RUN apt update && apt install -y iptables iputils-ping iproute2 tcpdump
WORKDIR /working
COPY run.sh run.sh
CMD ["/bin/sh", "run.sh"]
#RUN echo 1 > /proc/sys/net/ipv4/ip_forward # cannot run previleged code
