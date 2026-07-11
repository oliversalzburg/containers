FROM docker.io/library/ubuntu:26.04@sha256:b7f48194d4d8b763a478a621cdc81c27be222ba2206ca3ca6bc42b49685f3d9e

ARG CA_CERTIFICATES_VERSION="20260223"
ARG CURL_VERSION="8.18.0-1ubuntu2.3"
ARG TZDATA_VERSION="2026a-3ubuntu1"
ARG UNRAR_VERSION="1:7.2.4-1"
ARG UUIDRUNTIME_VERSION="2.41.3-3ubuntu2"
ARG XMLSTARLET_VERSION="1.6.1-5build1"
ARG XQ_VERSION="1.3.0-1build1"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  curl=${CURL_VERSION} \
  tzdata=${TZDATA_VERSION} \
  xq=${XQ_VERSION} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Plex
RUN curl --location --silent "https://plex.tv/downloads/details/5?build=linux-x86_64&channel=16&distro=debian" \
  | xq --xpath /MediaContainer/Release/Package/@url \
  | xargs curl --silent --output "plex.deb" \
  && dpkg -i plex.deb \
  && rm plex.deb

COPY [ "Preferences.xml", "/config/Preferences.xml" ]

WORKDIR /usr/lib/plexmediaserver/
ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/config/"
ENV PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver
ENV PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
ENV PLEX_MEDIA_SERVER_INFO_VENDOR="Debian GNU/Linux"
ENV PLEX_MEDIA_SERVER_INFO_MODEL=x86_64
ENV PLEX_MEDIA_SERVER_INFO_PLATFORM_VERSION=whatever

ENTRYPOINT [ "/usr/lib/plexmediaserver/Plex Media Server" ]
