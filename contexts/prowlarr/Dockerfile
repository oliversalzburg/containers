FROM docker.io/library/debian:12.5-slim@sha256:804194b909ef23fb995d9412c9378fb3505fe2427b70f3cc425339e48a828fca

# Versions of core components.
ARG PROWLARR_VERSION

WORKDIR /tmp

# renovate: datasource=repology depName=debian_12/ca-certificates
ENV CA_CERTIFICATES_VERSION="20230311"
# renovate: datasource=repology depName=debian_12/curl versioning=deb
ENV CURL_VERSION="7.88.1-10+deb12u5"
# renovate: datasource=repology depName=debian_12/libicu72 versioning=deb
ENV ICU_VERSION="72.1-3"
# renovate: datasource=repology depName=debian_12/sqlite3 versioning=deb
ENV LIBSQLITE_VERSION="3.40.1-2"
# renovate: datasource=repology depName=debian_12/openssl versioning=deb
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

# Prowlarr
RUN curl --location --silent "https://github.com/Prowlarr/Prowlarr/releases/download/v${PROWLARR_VERSION}/Prowlarr.master.${PROWLARR_VERSION}.linux-core-x64.tar.gz" --output "prowlarr.tar.gz" \
  # Quietly unpack
  && tar xzf prowlarr.tar.gz \
  && mv Prowlarr /opt/prowlarr

WORKDIR /opt/prowlarr

ENTRYPOINT [ "/opt/prowlarr/Prowlarr", "-nobrowser", "-data=/var/lib/prowlarr/" ]
