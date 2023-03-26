# Docker Gateway Example
Setup a docker container as gateway of other containers.

## Run example
First, install docker. 

Then, run commands below

```shell
git clone https://github.com/bnkrr/DockerGatewayExample.git
cd DockerGatewayExample
/bin/sh full-network-setup.sh
```

Open anoter shell, and run
```shell
/bin/sh full-client-setup.sh
```

Then you should see icmp packets from the client container redirected through gateway container.


## More Details

Setup a docker network.
```shell
docker network create --subnet 172.19.0.0/16 --gateway 172.19.255.254 --opt com.docker.network.bridge.name=br-clients my-network
```

Setup route rules.
```shell
# any clients from ip 172.19.0.1 (or other network) will go through route table 500
ip rule add from 172.19.0.1 lookup 500 pref 500 
# route table 500: default route is gateway container (172.19.255.253)
ip r add default via 172.19.255.253 table 500
```

With proper configuration of client ip (replace `172.19.0.1` with some network such as `172.19.0.0/24`), any clients added to this network will use `172.19.255.253` as gateway by default.