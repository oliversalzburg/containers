FROM docker.io/library/ubuntu:26.04@sha256:f3d28607ddd78734bb7f71f117f3c6706c666b8b76cbff7c9ff6e5718d46ff64

# Versions of core components.
ARG QBITTORRENT_VERSION

ARG BUILD_ESSENTIAL_VERSION="12.12ubuntu2"
ARG CA_CERTIFICATES_VERSION="20260223"
ARG CMAKE_VERSION="4.2.3-2ubuntu2"
ARG CURL_VERSION="8.18.0-1ubuntu2"
ARG DNSUTILS_VERSION="1:9.20.18-1ubuntu2"
ARG IPCALC_VERSION="1.0.3-2build1"
ARG IPROUTE_VERSION="6.19.0-1ubuntu1"
ARG IPTABLES_VERSION="1.8.11-2ubuntu3"
ARG IPUTILS_PING_VERSION="3:20250605-1ubuntu1"
ARG LIBBOOST_VERSION="1.90.0.1ubuntu3"
ARG LIBCAP2_VERSION="1:2.75-10ubuntu2"
ARG LIBQT6_CONCURRENT_VERSION="6.10.2+dfsg-7"
ARG LIBQT6_CORE_VERSION="6.10.2+dfsg-7"
ARG LIBQT6_GUI_VERSION="6.10.2+dfsg-7"
ARG LIBQT6_NETWORK_VERSION="6.10.2+dfsg-7"
ARG LIBQT6_SQLITE_VERSION="6.10.2+dfsg-7"
ARG LIBQT6_SQL_VERSION="6.10.2+dfsg-7"
ARG LIBQT6_UITOOLS_VERSION="6.10.2-1"
ARG LIBQT6_XML_VERSION="6.10.2+dfsg-7"
ARG LIBTORRENT_RASTERBAR_VERSION="2.0.12-1"
ARG LIBXCB_CURSOR_VERSION="0.1.6-1"
ARG LIBXKBCOMMON_X11_VERSION="1.13.1-1"
ARG LOCALES_VERSION="2.43-2ubuntu2"
ARG NATPMPC_VERSION="20230423-1.2build4"
ARG OPENSSL_VERSION="3.5.5-1ubuntu3"
ARG QT6_BASE_VERSION="6.10.2+dfsg-7"
ARG QT6_TOOLS_VERSION="6.10.2-1"
ARG TZDATA_VERSION="2026a-3ubuntu1"
ARG UNZIP_VERSION="6.0-29ubuntu1"
ARG WGET_VERSION="1.25.0-2ubuntu4"
ARG WIREGUARD_GO_VERSION="0.0.20231211-1build1"
ARG WIREGUARD_TOOLS_VERSION="1.0.20250521-1ubuntu1"
ARG XZ_UTILS_VERSION="5.8.3-1"
ARG ZLIB_VERSION="1:1.3.dfsg+really1.3.1-1ubuntu3"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  bind9-dnsutils=${DNSUTILS_VERSION} \
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
  libqt6concurrent6=${LIBQT6_CONCURRENT_VERSION} \
  libqt6core6t64=${LIBQT6_CORE_VERSION} \
  libqt6gui6=${LIBQT6_GUI_VERSION} \
  libqt6network6=${LIBQT6_NETWORK_VERSION} \
  libqt6sql6-sqlite=${LIBQT6_SQLITE_VERSION} \
  libqt6sql6=${LIBQT6_SQL_VERSION} \
  libqt6uitools6=${LIBQT6_UITOOLS_VERSION} \
  libqt6xml6=${LIBQT6_XML_VERSION} \
  libssl-dev=${OPENSSL_VERSION} \
  libssl3t64=${OPENSSL_VERSION} \
  libtorrent-rasterbar-dev=${LIBTORRENT_RASTERBAR_VERSION} \
  libtorrent-rasterbar2.0t64=${LIBTORRENT_RASTERBAR_VERSION} \
  libxcb-cursor-dev=${LIBXCB_CURSOR_VERSION} \
  libxkbcommon-x11-dev=${LIBXKBCOMMON_X11_VERSION} \
  locales=${LOCALES_VERSION} \
  natpmpc=${NATPMPC_VERSION} \
  openssl=${OPENSSL_VERSION} \
  qt6-base-dev-tools=${QT6_BASE_VERSION} \
  qt6-base-dev=${QT6_BASE_VERSION} \
  qt6-base-private-dev=${QT6_BASE_VERSION} \
  qt6-tools-dev-tools=${QT6_TOOLS_VERSION} \
  qt6-tools-dev=${QT6_TOOLS_VERSION} \
  qt6-tools-private-dev=${QT6_TOOLS_VERSION} \
  tzdata=${TZDATA_VERSION} \
  unzip=${UNZIP_VERSION} \
  wget=${WGET_VERSION} \
  wireguard-go=${WIREGUARD_GO_VERSION} \
  wireguard-tools=${WIREGUARD_TOOLS_VERSION} \
  xz-utils=${XZ_UTILS_VERSION} \
  zlib1g-dev=${ZLIB_VERSION} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN sed -i "/en_US.UTF-8/s/^# //g" /etc/locale.gen \
  && locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

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

FROM docker.io/library/ubuntu:26.04@sha256:f3d28607ddd78734bb7f71f117f3c6706c666b8b76cbff7c9ff6e5718d46ff64
COPY --from=0 / /
RUN ldconfig
WORKDIR /config
ENTRYPOINT [ "/usr/local/bin/qbittorrent-nox", "--profile=/config", "--relative-fastresume" ]
