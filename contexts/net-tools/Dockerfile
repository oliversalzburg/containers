FROM docker.io/library/ubuntu:26.04@sha256:3595d7fc4286a33fad0fd853a4063e654287a9c3787437d7937c94ca3f7a804e

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  bind9-dnsutils \
  btop \
  curl \
  ethtool \
  htop \
  iftop \
  iproute2 \
  iputils-arping \
  iputils-ping \
  iputils-tracepath \
  jq \
  mtr-tiny \
  netcat-openbsd \
  nethogs \
  nmap \
  tcpdump \
  traceroute \
  whois \
  wireshark \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

CMD [ "/usr/bin/bash" ]
