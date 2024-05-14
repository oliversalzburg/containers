FROM docker.io/library/debian:12.5-slim@sha256:804194b909ef23fb995d9412c9378fb3505fe2427b70f3cc425339e48a828fca

# Versions of core components.
ARG LIDARR_VERSION

WORKDIR /tmp

# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/ca-certificates
ENV CA_CERTIFICATES_VERSION="20230311"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/curl
ENV CURL_VERSION="7.88.1-10+deb12u5"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/libicu72
ENV ICU_VERSION="72.1-3"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/libsqlite3-0
ENV LIBSQLITE_VERSION="3.40.1-2"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/openssl
ENV OPENSSL_VERSION="3.0.11-1~deb12u2"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  curl=${CURL_VERSION} \
  libicu72=${ICU_VERSION} \
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


