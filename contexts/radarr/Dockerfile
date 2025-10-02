FROM docker.io/library/ubuntu:plucky-20250925.1@sha256:61715ab46e7ffac134f0687b9d96826db4e2759e56b00ffd7907c5bf38a9035a

# Versions of core components.
ARG RADARR_VERSION

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/ca-certificates versioning=deb
ENV CA_CERTIFICATES_VERSION="20241223"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/curl versioning=deb
ENV CURL_VERSION="8.12.1-3ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/libicu76 versioning=deb
ENV ICU_VERSION="76.1-1ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/libsqlite3-0 versioning=deb
ENV LIBSQLITE_VERSION="3.46.1-3ubuntu0.3"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/openssl versioning=deb
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

# Radarr
RUN curl --location --silent "https://github.com/Radarr/Radarr/releases/download/v${RADARR_VERSION}/Radarr.master.${RADARR_VERSION}.linux-core-x64.tar.gz" --output "radarr.tar.gz" \
  # Quietly unpack
  && tar xzf radarr.tar.gz \
  && rm radarr.tar.gz \
  && mv Radarr /opt/radarr

WORKDIR /opt/radarr

ENTRYPOINT [ "/opt/radarr/Radarr", "-nobrowser", "-data=/var/lib/radarr/" ]
