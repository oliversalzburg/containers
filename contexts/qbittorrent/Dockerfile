FROM docker.io/library/debian:12.5-slim@sha256:804194b909ef23fb995d9412c9378fb3505fe2427b70f3cc425339e48a828fca

# Versions of core components.
ARG QBITTORRENT_VERSION

WORKDIR /tmp

# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/ca-certificates
ENV CA_CERTIFICATES_VERSION="20230311"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/cmake
ENV CMAKE_VERSION="3.25.1-1"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/curl
ENV CURL_VERSION="7.88.1-10+deb12u5"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/g++
ENV GPP_VERSION="4:12.2.0-3"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/gcc
ENV GCC_VERSION="4:12.2.0-3"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/libtorrent-rasterbar-dev
ENV LIBTORRENT_RASTERBAR_VERSION="2.0.8-1+b1"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/make
ENV MAKE_VERSION="4.3-4.1"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/openssl
ENV OPENSSL_VERSION="3.0.11-1~deb12u2"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/qtbase5-dev
ENV QTBASE_VERSION="5.15.8+dfsg-11"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/qttools5-dev
ENV QTTOOLS_VERSION="5.15.8-2"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/zlib1g-dev
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
