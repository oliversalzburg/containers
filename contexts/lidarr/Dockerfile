FROM docker.io/library/ubuntu:24.04@sha256:3f85b7caad41a95462cf5b787d8a04604c8262cdcdf9a472b8c52ef83375fe15

# Versions of core components.
ARG LIDARR_VERSION

WORKDIR /tmp

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/ca-certificates versioning=deb
ENV CA_CERTIFICATES_VERSION="20240203"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/curl versioning=deb
ENV CURL_VERSION="7.88.1-10+deb12u5"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libicu74 versioning=deb
ENV ICU_VERSION="72.1-3"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libsqlite3-0 versioning=deb
ENV LIBSQLITE_VERSION="3.40.1-2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/openssl versioning=deb
ENV OPENSSL_VERSION="3.0.11-1~deb12u2"

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

# Lidarr
RUN curl --location --silent "https://github.com/Lidarr/Lidarr/releases/download/v${LIDARR_VERSION}/Lidarr.master.${LIDARR_VERSION}.linux-core-x64.tar.gz" --output "lidarr.tar.gz" \
  # Quietly unpack
  && tar xzf lidarr.tar.gz \
  && mv Lidarr /opt/lidarr

WORKDIR /opt/lidarr

ENTRYPOINT [ "/opt/lidarr/Lidarr", "-nobrowser", "-data=/var/lib/lidarr/" ]


