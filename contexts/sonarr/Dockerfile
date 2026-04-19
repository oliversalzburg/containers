FROM docker.io/library/ubuntu:plucky-20251001@sha256:27771fb7b40a58237c98e8d3e6b9ecdd9289cec69a857fccfb85ff36294dac20

# Versions of core components.
ARG SONARR_VERSION

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

# Sonarr
RUN curl --location --silent "https://github.com/Sonarr/Sonarr/releases/download/v${SONARR_VERSION}/Sonarr.main.${SONARR_VERSION}.linux-x64.tar.gz" --output "sonarr.tar.gz" \
  # Quietly unpack
  && tar xzf sonarr.tar.gz \
  && rm sonarr.tar.gz \
  && mv Sonarr /opt/sonarr

WORKDIR /opt/sonarr

ENTRYPOINT [ "/opt/sonarr/Sonarr", "-nobrowser", "-data=/var/lib/sonarr/" ]
