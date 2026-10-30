FROM docker.io/library/ubuntu:26.04@sha256:6a06111c3b0a8600feadb270aec771dc239bf407b25625f93f44ab00e11f4d3c

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
