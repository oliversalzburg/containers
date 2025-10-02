FROM docker.io/library/ubuntu:noble@sha256:fdb6c9ceb1293dcb0b7eda5df195b15303b01857d7b10f98489e7691d20aa2a1

# Versions of core components.
ARG PROWLARR_VERSION

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/ca-certificates versioning=deb
ENV CA_CERTIFICATES_VERSION="20240203"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/curl versioning=deb
ENV CURL_VERSION="8.5.0-2ubuntu10.6"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libicu74 versioning=deb
ENV ICU_VERSION="74.2-1ubuntu3.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libsqlite3-0 versioning=deb
ENV LIBSQLITE_VERSION="3.45.1-1ubuntu2.5"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/openssl versioning=deb
ENV OPENSSL_VERSION="3.0.13-0ubuntu3.6"

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

# Prowlarr
RUN curl --location --silent "https://github.com/Prowlarr/Prowlarr/releases/download/v${PROWLARR_VERSION}/Prowlarr.master.${PROWLARR_VERSION}.linux-core-x64.tar.gz" --output "prowlarr.tar.gz" \
  # Quietly unpack
  && tar xzf prowlarr.tar.gz \
  && rm prowlarr.tar.gz \
  && mv Prowlarr /opt/prowlarr

WORKDIR /opt/prowlarr

ENTRYPOINT [ "/opt/prowlarr/Prowlarr", "-nobrowser", "-data=/var/lib/prowlarr/" ]
