FROM docker.io/library/debian:12.5-slim@sha256:155280b00ee0133250f7159b567a07d7cd03b1645714c3a7458b2287b0ca83cb

# Versions of core components.
ARG VERSION_QBITTORRENT

WORKDIR /tmp

# renovate: datasource=repology depName=debian_12/ca-certificates versioning=loose
ENV VERSION_CA_CERTIFICATES="20230311"
# renovate: datasource=repology depName=debian_12/cmake versioning=loose
ENV VERSION_CMAKE="3.25.1-1"
# renovate: datasource=repology depName=debian_12/curl versioning=loose
ENV VERSION_CURL="7.88.1-10+deb12u5"
# renovate: datasource=repology depName=debian_12/g++ versioning=loose
ENV VERSION_GPP="4:12.2.0-3"
# renovate: datasource=repology depName=debian_12/gcc versioning=loose
ENV VERSION_GCC="4:12.2.0-3"
# renovate: datasource=repology depName=debian_12/boost-defaults versioning=loose
ENV VERSION_LIBBOOST="1.74.0.3"
# renovate: datasource=repology depName=debian_12/libtorrent-rasterbar versioning=loose
ENV VERSION_LIBTORRENT_RASTERBAR="2.0.8-1+b1"
# renovate: datasource=repology depName=debian_12/make-dfsg versioning=loose
ENV VERSION_MAKE="4.3-4.1"
# renovate: datasource=repology depName=debian_12/openssl versioning=loose
ENV VERSION_OPENSSL="3.0.11-1~deb12u2"
# renovate: datasource=repology depName=debian_12/qtbase-opensource-src versioning=loose
ENV VERSION_QT="5.15.8+dfsg-11"
# renovate: datasource=repology depName=debian_12/qttools-opensource-src versioning=loose
ENV VERSION_QTTOOLS="5.15.8-2"
# renovate: datasource=repology depName=debian_12/zlib versioning=loose
ENV VERSION_ZLIB="1:1.2.13.dfsg-1"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${VERSION_CA_CERTIFICATES} \
  cmake=${VERSION_CMAKE} \
  curl=${VERSION_CURL} \
  g++=${VERSION_GPP} \
  gcc=${VERSION_GCC} \
  libboost-dev=${VERSION_LIBBOOST} \
  libssl3=${VERSION_OPENSSL} \
  libssl-dev=${VERSION_OPENSSL} \
  libtorrent-rasterbar-dev=${VERSION_LIBTORRENT_RASTERBAR} \
  make=${VERSION_MAKE} \
  openssl=${VERSION_OPENSSL} \
  qtbase5-dev=${VERSION_QT} \
  qttools5-dev=${VERSION_QTTOOLS} \
  zlib1g-dev=${VERSION_ZLIB} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# qBittorrent
RUN curl --location --silent "https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-${VERSION_QBITTORRENT}.tar.gz" --output "qbittorrent.tar.gz" \
  # Quietly unpack
  && tar xzf qbittorrent.tar.gz \
  # Build qBittorrent
  && cd "qBittorrent-release-${VERSION_QBITTORRENT}" \
  && cmake -B build -DCMAKE_BUILD_TYPE=Release -DGUI=OFF \
  && cmake --build build --parallel \
  && cmake --install build \
  && rm -rf /tmp/*

WORKDIR /config

ENTRYPOINT [ "/usr/local/bin/qbittorrent-nox", "--profile=/config", "--relative-fastresume" ]
