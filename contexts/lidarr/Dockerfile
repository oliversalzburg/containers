FROM docker.io/library/ubuntu:plucky-20251001@sha256:27771fb7b40a58237c98e8d3e6b9ecdd9289cec69a857fccfb85ff36294dac20

# Versions of core components.
ARG LIDARR_VERSION

ENV CA_CERTIFICATES_VERSION="20241223"
ENV CURL_VERSION="8.12.1-3ubuntu1"
ENV ICU_VERSION="76.1-1ubuntu2"
ENV LIBSQLITE_VERSION="3.46.1-3ubuntu0.3"
ENV OPENSSL_VERSION="3.4.1-1ubuntu4"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  curl=${CURL_VERSION} \
  libicu76=${ICU_VERSION} \
  libsqlite3-0=${LIBSQLITE_VERSION} \
  openssl=${OPENSSL_VERSION} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Lidarr
RUN curl --location --silent "https://github.com/Lidarr/Lidarr/releases/download/v${LIDARR_VERSION}/Lidarr.master.${LIDARR_VERSION}.linux-core-x64.tar.gz" --output "lidarr.tar.gz" \
  # Quietly unpack
  && tar xzf lidarr.tar.gz \
  && rm lidarr.tar.gz \
  && mv Lidarr /opt/lidarr

WORKDIR /opt/lidarr

ENTRYPOINT [ "/opt/lidarr/Lidarr", "-nobrowser", "-data=/var/lib/lidarr/" ]
