FROM docker.io/library/ubuntu:noble@sha256:e3f92abc0967a6c19d0dfa2d55838833e947b9d74edbcb0113e48535ad4be12a

# Versions of core components.
ARG SONARR_VERSION

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/ca-certificates versioning=deb
ENV CA_CERTIFICATES_VERSION="20240203"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/curl versioning=deb
ENV CURL_VERSION="8.5.0-2ubuntu10.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libicu74 versioning=deb
ENV ICU_VERSION="74.2-1ubuntu3"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libsqlite3-0 versioning=deb
ENV LIBSQLITE_VERSION="3.45.1-1ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/openssl versioning=deb
ENV OPENSSL_VERSION="3.0.13-0ubuntu3.1"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  curl=${CURL_VERSION} \
  libicu74=${ICU_VERSION} \
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
