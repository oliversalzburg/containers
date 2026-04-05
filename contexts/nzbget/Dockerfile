FROM docker.io/library/ubuntu:plucky-20251001@sha256:27771fb7b40a58237c98e8d3e6b9ecdd9289cec69a857fccfb85ff36294dac20

# Versions of core components.
ARG NZBGET_VERSION

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/7zip versioning=deb
ENV SEVENZIP_VERSION="24.09+dfsg-7"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/ca-certificates versioning=deb
ENV CA_CERTIFICATES_VERSION="20241223"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/curl versioning=deb
ENV CURL_VERSION="8.12.1-3ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/python3 versioning=deb
ARG PYTHON3_VERSION="3.13.3-1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/unrar versioning=deb
ENV UNRAR_VERSION="1:7.1.5-3"

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
