FROM docker.io/library/ubuntu:plucky-20251001@sha256:393b8507b8b5d3cdeece165b5c85d517d343842af210e67b091aaf6cf1fc8369

# Versions of core components.
ARG SONARR_VERSION

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

# Sonarr
RUN curl --location --silent "https://github.com/Sonarr/Sonarr/releases/download/v${SONARR_VERSION}/Sonarr.main.${SONARR_VERSION}.linux-x64.tar.gz" --output "sonarr.tar.gz" \
  # Quietly unpack
  && tar xzf sonarr.tar.gz \
  && rm sonarr.tar.gz \
  && mv Sonarr /opt/sonarr

WORKDIR /opt/sonarr

ENTRYPOINT [ "/opt/sonarr/Sonarr", "-nobrowser", "-data=/var/lib/sonarr/" ]
