FROM docker.io/library/ubuntu:26.04@sha256:f144425ff09be612d6d9ad965196e9cdc23dae1f42110a8a11a3e9a8198759f7

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
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

CMD [ "/usr/bin/bash" ]
