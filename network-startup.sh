NETWORK_NAME=network-with-gateway-container 

# create docker network
docker network rm -f ${NETWORK_NAME}
docker network create --subnet 172.19.0.0/16 --gateway 172.19.255.254 --opt com.docker.network.bridge.name=br-clients ${NETWORK_NAME}

# Setup route rules
ip rule del from 172.19.0.1
ip rule add from 172.19.0.1 lookup 500 pref 500
ip r flush table 500
ip r add default via 172.19.255.253 table 500

# run gateway container
docker run --rm -it --cap-add NET_ADMIN --name container_gateway --network network-with-gateway-container --ip 172.19.255.253 gateway:latest
