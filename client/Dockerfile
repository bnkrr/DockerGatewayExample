# a minimal example of client.
FROM debian:11-slim

RUN apt update && apt install -y iputils-ping iproute2 curl

CMD ["ping", "1.1.1.1"]
