FROM docker.io/library/ubuntu:plucky-20250730@sha256:57665ab8178042ef197191fd77d21d8a2f7f535acd26ff7bd548b1f340f081d7

# Versions of core components.
ARG QBITTORRENT_VERSION

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/build-essential versioning=deb
ARG BUILD_ESSENTIAL_VERSION="12.12ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/ca-certificates versioning=deb
ARG CA_CERTIFICATES_VERSION="20241223"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/cmake versioning=deb
ARG CMAKE_VERSION="3.31.6-1ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/curl versioning=deb
ARG CURL_VERSION="8.12.1-3ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/ipcalc-ng versioning=deb
ARG IPCALC_VERSION="1.0.3-2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/iproute2 versioning=deb
ARG IPROUTE_VERSION="6.14.0-1ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/iptables versioning=deb
ARG IPTABLES_VERSION="1.8.11-2ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/iputils-ping versioning=deb
ARG IPUTILS_PING_VERSION="3:20240905-1ubuntu1.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/libboost-dev versioning=deb
ARG LIBBOOST_VERSION="1.83.0.2ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/libcap2-bin versioning=deb
ARG LIBCAP2_VERSION="1:2.73-4ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/libqt6concurrent6 versioning=deb
ARG LIBQT6_CONCURRENT_VERSION="6.8.3+dfsg-0ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/libqt6core6t64 versioning=deb
ARG LIBQT6_CORE_VERSION="6.8.3+dfsg-0ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/libqt6gui6 versioning=deb
ARG LIBQT6_GUI_VERSION="6.8.3+dfsg-0ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/libqt6network6 versioning=deb
ARG LIBQT6_NETWORK_VERSION="6.8.3+dfsg-0ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/libqt6sql6-sqlite versioning=deb
ARG LIBQT6_SQLITE_VERSION="6.8.3+dfsg-0ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/libqt6sql6 versioning=deb
ARG LIBQT6_SQL_VERSION="6.8.3+dfsg-0ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/libqt6uitools6 versioning=deb
ARG LIBQT6_UITOOLS_VERSION="6.8.3-0ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/libqt6xml6 versioning=deb
ARG LIBQT6_XML_VERSION="6.8.3+dfsg-0ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/libtorrent-rasterbar-dev versioning=deb
ARG LIBTORRENT_RASTERBAR_VERSION="2.0.11-1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/libxcb-cursor-dev versioning=deb
ARG LIBXCB_CURSOR_VERSION="0.1.5-1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/libxkbcommon-x11-dev versioning=deb
ARG LIBXKBCOMMON_X11_VERSION="1.7.0-2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/locales versioning=deb
ARG LOCALES_VERSION="2.41-6ubuntu1.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/natpmpc versioning=deb
ARG NATPMPC_VERSION="20230423-1.2build2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/openssl versioning=deb
ARG OPENSSL_VERSION="3.4.1-1ubuntu3"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/python3 versioning=deb
ARG PYTHON3_VERSION="3.13.3-1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/qt6-base-dev versioning=deb
ARG QT6_BASE_VERSION="6.8.3+dfsg-0ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/qt6-tools-dev versioning=deb
ARG QT6_TOOLS_VERSION="6.8.3-0ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/tzdata versioning=deb
ARG TZDATA_VERSION="2025b-1ubuntu1.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/unzip versioning=deb
ARG UNZIP_VERSION="6.0-28ubuntu6"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/wget versioning=deb
ARG WGET_VERSION="1.24.5-2ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/universe/wireguard-go versioning=deb
ARG WIREGUARD_VERSION="0.0.20231211-1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/wireguard-tools versioning=deb
ARG WIREGUARD_TOOLS_VERSION="1.0.20210914-1.1ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/xz-utils versioning=deb
ARG XZ_UTILS_VERSION="5.6.4-1ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/zlib1g-dev versioning=deb
ARG ZLIB_VERSION="1:1.3.dfsg+really1.3.1-1ubuntu1"

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
  wireguard-go=${WIREGUARD_VERSION} \
  wireguard-tools=${WIREGUARD_TOOLS_VERSION} \
  xz-utils=${XZ_UTILS_VERSION} \
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

FROM docker.io/library/ubuntu:plucky-20250730@sha256:57665ab8178042ef197191fd77d21d8a2f7f535acd26ff7bd548b1f340f081d7
COPY --from=0 / /
RUN ldconfig
WORKDIR /config
ENTRYPOINT [ "/usr/local/bin/qbittorrent-nox", "--profile=/config", "--relative-fastresume" ]
