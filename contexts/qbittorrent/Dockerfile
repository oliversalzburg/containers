FROM docker.io/library/ubuntu:noble@sha256:80dd3c3b9c6cecb9f1667e9290b3bc61b78c2678c02cbdae5f0fea92cc6734ab

# Versions of core components.
ARG QBITTORRENT_VERSION

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/ca-certificates versioning=deb
ARG CA_CERTIFICATES_VERSION="20240203"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/cmake versioning=deb
ARG CMAKE_VERSION="3.28.3-1build7"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/curl versioning=deb
ARG CURL_VERSION="8.5.0-2ubuntu10.6"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/g++ versioning=deb
ARG GPP_VERSION="4:13.2.0-7ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/gcc versioning=deb
ARG GCC_VERSION="4:13.2.0-7ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libboost-dev versioning=deb
ARG LIBBOOST_VERSION="1.83.0.1ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/universe/libtorrent-rasterbar-dev versioning=deb
ARG LIBTORRENT_RASTERBAR_VERSION="2.0.10-1.1build2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/make versioning=deb
ARG MAKE_VERSION="4.3-4.1build2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/openssl versioning=deb
ARG OPENSSL_VERSION="3.0.13-0ubuntu3.4"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/python3 versioning=deb
ARG PYTHON3_VERSION="3.12.3-0ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/universe/qtbase5-dev versioning=deb
ARG QTBASE_VERSION="5.15.13+dfsg-1ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/universe/qttools5-dev versioning=deb
ARG QTTOOLS_VERSION="5.15.13-1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/zlib1g-dev versioning=deb
ARG ZLIB_VERSION="1:1.3.dfsg-3.1ubuntu2.1"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  cmake=${CMAKE_VERSION} \
  curl=${CURL_VERSION} \
  g++=${GPP_VERSION} \
  gcc=${GCC_VERSION} \
  libboost-dev=${LIBBOOST_VERSION} \
  libqt5core5t64=${QTBASE_VERSION} \
  libqt5gui5t64=${QTBASE_VERSION} \
  libqt5network5t64=${QTBASE_VERSION} \
  libqt5sql5t64=${QTBASE_VERSION} \
  libqt5xml5t64=${QTBASE_VERSION} \
  libssl3=${OPENSSL_VERSION} \
  libssl-dev=${OPENSSL_VERSION} \
  libtorrent-rasterbar2.0t64=${LIBTORRENT_RASTERBAR_VERSION} \
  libtorrent-rasterbar-dev=${LIBTORRENT_RASTERBAR_VERSION} \
  make=${MAKE_VERSION} \
  openssl=${OPENSSL_VERSION} \
  python3=${PYTHON3_VERSION} \
  qtbase5-dev=${QTBASE_VERSION} \
  qtbase5-private-dev=${QTBASE_VERSION} \
  qttools5-dev=${QTTOOLS_VERSION} \
  zlib1g-dev=${ZLIB_VERSION} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# qBittorrent
WORKDIR /usr/src/qbittorrent
RUN curl --location --silent "https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-${QBITTORRENT_VERSION}.tar.gz" --output "qbittorrent.tar.gz" \
  # Quietly unpack
  && tar xzf qbittorrent.tar.gz \
  && rm qbittorrent.tar.gz \
  # Build qBittorrent
  && cd "qBittorrent-release-${QBITTORRENT_VERSION}" \
  && ./configure --disable-gui \
  && make --jobs $(nproc --all) \
  && make install

RUN apt-get remove --purge --yes \
  cmake \
  g++ \
  gcc \
  libboost-dev \
  libtorrent-rasterbar-dev \
  libssl-dev \
  make \
  qtbase5-dev \
  qtbase5-private-dev \
  qttools5-dev \
  zlib1g-dev \
  && apt-get autoremove --yes \
  && apt-get clean

FROM docker.io/library/ubuntu:noble@sha256:80dd3c3b9c6cecb9f1667e9290b3bc61b78c2678c02cbdae5f0fea92cc6734ab
COPY --from=0 / /
RUN ldconfig
WORKDIR /config
ENTRYPOINT [ "/usr/local/bin/qbittorrent-nox", "--profile=/config", "--relative-fastresume" ]
