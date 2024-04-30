FROM docker.io/library/debian:12.5-slim@sha256:155280b00ee0133250f7159b567a07d7cd03b1645714c3a7458b2287b0ca83cb

# Versions of core components.
ARG VERSION_RADARR

WORKDIR /tmp

# renovate: datasource=repology depName=debian_12/ca-certificates versioning=loose
ENV VERSION_CA_CERTIFICATES="20230311"
# renovate: datasource=repology depName=debian_12/curl versioning=loose
ENV VERSION_CURL="7.88.1-10+deb12u5"
# renovate: datasource=repology depName=debian_12/icu versioning=loose
ENV VERSION_ICU="72.1-3"
# renovate: datasource=repology depName=debian_12/icu versioning=loose
ENV VERSION_LIBSQLITE="3.40.1-2"
# renovate: datasource=repology depName=debian_12/openssl versioning=loose
ENV VERSION_OPENSSL="3.0.11-1~deb12u2"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${VERSION_CA_CERTIFICATES} \
  curl=${VERSION_CURL} \
  libicu72=${VERSION_ICU} \
  libsqlite3-0=${VERSION_LIBSQLITE} \
  openssl=${VERSION_OPENSSL} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Radarr
RUN curl --location --silent "https://github.com/Radarr/Radarr/releases/download/v${VERSION_RADARR}/Radarr.master.${VERSION_RADARR}.linux-core-x64.tar.gz" --output "radarr.tar.gz" \
  # Quietly unpack
  && tar xzf radarr.tar.gz \
  && mv Radarr /opt/radarr

WORKDIR /opt/radarr

ENTRYPOINT [ "/opt/radarr/Radarr", "-nobrowser", "-data=/var/lib/radarr/" ]
