FROM docker.io/library/ubuntu:26.04@sha256:b7f48194d4d8b763a478a621cdc81c27be222ba2206ca3ca6bc42b49685f3d9e

# Versions of core components.
ARG NZBGET_VERSION

ARG SEVENZIP_VERSION="26.00+dfsg-1"
ARG CA_CERTIFICATES_VERSION="20260223"
ARG CURL_VERSION="8.18.0-1ubuntu2.3"
ARG PYTHON3_VERSION="3.14.3-0ubuntu2"
ARG UNRAR_VERSION="1:7.2.4-1"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  7zip=${SEVENZIP_VERSION} \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  curl=${CURL_VERSION} \
  python3=${PYTHON3_VERSION} \
  unrar=${UNRAR_VERSION} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# NZBGet
WORKDIR /opt
RUN curl --location --silent "https://github.com/nzbgetcom/nzbget/releases/download/v${NZBGET_VERSION}/nzbget-${NZBGET_VERSION}-bin-linux.run" --output "nzbget-bin-linux.run" \
  && mkdir /config \
  && touch /config/nzbget.conf \
  && sh nzbget-bin-linux.run

WORKDIR /opt/nzbget
CMD [ "/opt/nzbget/nzbget", "-s", "-c", "/config/nzbget.conf" ]
