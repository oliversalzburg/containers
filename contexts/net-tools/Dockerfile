FROM docker.io/library/ubuntu:26.04@sha256:0e73b71479e7bc5f006bca872e25c3cd680dc052a0116f90d63ae363537db0dd

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
