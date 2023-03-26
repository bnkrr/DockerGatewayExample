# setup client's network
docker run --rm -it --name container_client --network network-with-gateway-container client:latest
#docker run --rm -it --name container_client --network network-with-gateway-container client:latest ping 8.8.8.8
#docker run --rm -it --name container_client --network network-with-gateway-container client:latest curl -LSs ifconfig.io
