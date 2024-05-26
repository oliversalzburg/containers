FROM docker.io/library/ubuntu:24.04

# Versions of core components.
ARG QBITTORRENT_VERSION

WORKDIR /tmp

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/ca-certificates versioning=deb
ENV CA_CERTIFICATES_VERSION="20230311"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/cmake versioning=deb
ENV CMAKE_VERSION="3.25.1-1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/curl versioning=deb
ENV CURL_VERSION="7.88.1-10+deb12u5"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/g++ versioning=deb
ENV GPP_VERSION="4:12.2.0-3"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/gcc versioning=deb
ENV GCC_VERSION="4:12.2.0-3"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libtorrent-rasterbar-dev versioning=deb
ENV LIBTORRENT_RASTERBAR_VERSION="2.0.8-1+b1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/make versioning=deb
ENV MAKE_VERSION="4.3-4.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/openssl versioning=deb
ENV OPENSSL_VERSION="3.0.13-0ubuntu3"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/qtbase5-dev versioning=deb
ENV QTBASE_VERSION="5.15.8+dfsg-11"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/qttools5-dev versioning=deb
ENV QTTOOLS_VERSION="5.15.8-2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/zlib1g-dev versioning=deb
ENV ZLIB_VERSION="1:1.2.13.dfsg-1"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  cmake=${CMAKE_VERSION} \
  curl=${CURL_VERSION} \
  g++=${GPP_VERSION} \
  gcc=${GCC_VERSION} \
  libboost-dev \
  libssl3=${OPENSSL_VERSION} \
  libssl-dev=${OPENSSL_VERSION} \
  libtorrent-rasterbar-dev=${LIBTORRENT_RASTERBAR_VERSION} \
  make=${MAKE_VERSION} \
  openssl=${OPENSSL_VERSION} \
  qtbase5-dev=${QTBASE_VERSION} \
  qttools5-dev=${QTTOOLS_VERSION} \
  zlib1g-dev=${ZLIB_VERSION} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# qBittorrent
RUN curl --location --silent "https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-${QBITTORRENT_VERSION}.tar.gz" --output "qbittorrent.tar.gz" \
  # Quietly unpack
  && tar xzf qbittorrent.tar.gz \
  # Build qBittorrent
  && cd "qBittorrent-release-${QBITTORRENT_VERSION}" \
  && cmake -B build -DCMAKE_BUILD_TYPE=Release -DGUI=OFF \
  && cmake --build build --parallel \
  && cmake --install build \
  && rm -rf /tmp/* \
  && ln --symbolic --no-target-directory /dev/stdout /tmp/qbittorrent.log

WORKDIR /config

ENTRYPOINT [ "/usr/local/bin/qbittorrent-nox", "--profile=/config", "--relative-fastresume" ]
