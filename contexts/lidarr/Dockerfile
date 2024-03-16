FROM docker.io/library/debian:12.5-slim@sha256:d02c76d82364cedca16ba3ed6f9102406fa9fa8833076a609cabf14270f43dfc

# Versions of core components.
ARG VERSION_LIDARR

WORKDIR /tmp

# renovate: datasource=repology depName=debian_12/ca-certificates versioning=loose
ENV VERSION_CA_CERTIFICATES="20230311"
# renovate: datasource=repology depName=debian_12/curl versioning=loose
ENV VERSION_CURL="7.88.1-10+deb12u5"
# renovate: datasource=repology depName=debian_12/openssl versioning=loose
ENV VERSION_OPENSSL="3.0.11-1~deb12u2"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${VERSION_CA_CERTIFICATES} \
  curl=${VERSION_CURL} \
  openssl=${VERSION_OPENSSL} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Lidarr
RUN curl --location --silent "https://github.com/Lidarr/Lidarr/releases/download/v${VERSION_LIDARR}/Lidarr.master.${VERSION_LIDARR}.linux-core-x64.tar.gz" --output "lidarr.tar.gz" \
  # Quietly unpack
  && tar xzf lidarr.tar.gz \
  && mv Lidarr /opt/lidarr

WORKDIR /opt/lidarr

ENTRYPOINT [ "/opt/lidarr", "-nobrowser", "-data=/var/lib/lidarr/" ]


