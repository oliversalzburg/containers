FROM docker.io/library/ubuntu:26.04@sha256:c098726dd9b9733f3e885f8de0ef375206a311b0a317eadc40d347b1115fb944

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN rm /etc/dpkg/dpkg.cfg.d/excludes

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  bind9-dnsutils \
  btop \
  ca-certificates \
  curl \
  ethtool \
  htop \
  iftop \
  iproute2 \
  iputils-arping \
  iputils-ping \
  iputils-tracepath \
  jq \
  man-db \
  manpages \
  manpages-posix \
  mtr-tiny \
  netcat-openbsd \
  nethogs \
  nmap \
  tcpdump \
  traceroute \
  vim \
  whois \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

CMD [ "/usr/bin/bash" ]
