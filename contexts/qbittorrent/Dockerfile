FROM docker.io/library/ubuntu:plucky

# Versions of core components.
ARG QBITTORRENT_VERSION

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/build-essential versioning=deb
ARG BUILD_ESSENTIAL_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/ca-certificates versioning=deb
ARG CA_CERTIFICATES_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/cmake versioning=deb
ARG CMAKE_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/curl versioning=deb
ARG CURL_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/ipcalc-ng versioning=deb
ARG IPCALC_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/iproute2 versioning=deb
ARG IPROUTE_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/iptables versioning=deb
ARG IPTABLES_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/iputils-ping versioning=deb
ARG IPUTILS_PING_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/libboost-dev versioning=deb
ARG LIBBOOST_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/libcap2-bin versioning=deb
ARG LIBCAP2_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/libqt6concurrent6 versioning=deb
ARG LIBQT6_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/libtorrent-rasterbar-dev versioning=deb
ARG LIBTORRENT_RASTERBAR_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/openssl versioning=deb
ARG OPENSSL_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/python3 versioning=deb
ARG PYTHON3_VERSION="*"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/zlib1g-dev versioning=deb
ARG ZLIB_VERSION="*"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  build-essential=${BUILD_ESSENTIAL_VERSION} \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  cmake=${CMAKE_VERSION} \
  curl=${CURL_VERSION} \
  ipcalc-ng=${IPCALC_VERSION} \
  iproute2=${IPROUTE_VERSION} \
  iptables=${IPTABLES_VERSION} \
  iputils-ping=${IPUTILS_PING_VERSION} \
  libboost-dev=${LIBBOOST_VERSION} \
  libcap2-bin=${LIBCAP2_VERSION} \
  libqt6concurrent6=${LIBQT6_VERSION} \
  libqt6core6t64=${LIBQT6_VERSION} \
  libqt6gui6=${LIBQT6_VERSION} \
  libqt6network6=${LIBQT6_VERSION} \
  libqt6sql6=${LIBQT6_VERSION} \
  libqt6xml6=${LIBQT6_VERSION} \
  libqt6sql6-sqlite=${LIBQT6_VERSION} \
  libqt6uitools6=${LIBQT6_VERSION} \
  libssl-dev=${OPENSSL_VERSION} \
  libssl3t64=${OPENSSL_VERSION} \
  libtorrent-rasterbar-dev=${LIBTORRENT_RASTERBAR_VERSION} \
  libtorrent-rasterbar2.0t64=${LIBTORRENT_RASTERBAR_VERSION} \
  libxcb-cursor-dev \
  libxkbcommon-x11-dev \
  locales \
  natpmpc \
  ninja-build \
  openssl=${OPENSSL_VERSION} \
  qt6-base-dev \
  qt6-base-dev-tools \
  qt6-base-private-dev \
  qt6-tools-dev \
  qt6-tools-dev-tools \
  qt6-tools-private-dev \
  tzdata \
  unzip \
  wget \
  wireguard-go \
  wireguard-tools \
  xz-utils \
  zlib1g-dev=${ZLIB_VERSION} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN sed -i "/en_US.UTF-8/s/^# //g" /etc/locale.gen \
  && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# qBittorrent
WORKDIR /usr/src/qbittorrent
RUN curl --location --silent "https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-${QBITTORRENT_VERSION}.tar.gz" --output "qbittorrent.tar.gz" \
  # Quietly unpack
  && tar xzf qbittorrent.tar.gz \
  && rm qbittorrent.tar.gz \
  # Build qBittorrent
  && cd "qBittorrent-release-${QBITTORRENT_VERSION}" \
  && cmake -B build -DCMAKE_BUILD_TYPE=Release -DGUI=OFF \
  && cmake --build build \
  && cmake --install build

RUN apt-get remove --purge --yes \
  cmake \
  g++ \
  gcc \
  libboost-dev \
  libtorrent-rasterbar-dev \
  libssl-dev \
  make \
  ninja-build \
  qt6-base-dev \
  qt6-base-dev-tools \
  qt6-base-private-dev \
  qt6-tools-dev \
  qt6-tools-dev-tools \
  qt6-tools-private-dev \
  zlib1g-dev \
  && apt-get autoremove --yes \
  && apt-get clean

FROM docker.io/library/ubuntu:plucky
COPY --from=0 / /
RUN ldconfig
WORKDIR /config
ENTRYPOINT [ "/usr/local/bin/qbittorrent-nox", "--profile=/config", "--relative-fastresume" ]
