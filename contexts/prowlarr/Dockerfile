FROM docker.io/library/debian:12.5-slim@sha256:ccb33c3ac5b02588fc1d9e4fc09b952e433d0c54d8618d0ee1afadf1f3cf2455

# Versions of core components.
ARG VERSION_PROWLARR

WORKDIR /tmp

# renovate: datasource=repology depName=debian_12/ca-certificates versioning=loose
ENV VERSION_CA_CERTIFICATES="20230311"
# renovate: datasource=repology depName=debian_12/curl versioning=loose
ENV VERSION_CURL="7.88.1-10+deb12u5"
# renovate: datasource=repology depName=debian_12/openssl versioning=loose
ENV VERSION_OPENSSL="3.0.11-1~deb12u2"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${VERSION_CA_CERTIFICATES} \
  curl=${VERSION_CURL} \
  openssl=${VERSION_OPENSSL} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Prowlarr
RUN curl --location --silent "https://github.com/Prowlarr/Prowlarr/releases/download/v${VERSION_PROWLARR}/Prowlarr.master.${VERSION_PROWLARR}.linux-core-x64.tar.gz" --output "prowlarr.tar.gz" \
  # Quietly unpack
  && tar xzf prowlarr.tar.gz \
  && mv Prowlarr /opt/prowlarr

WORKDIR /opt/prowlarr

ENTRYPOINT [ "/opt/prowlarr" "-nobrowser", "-data=/var/lib/prowlarr/" ]
