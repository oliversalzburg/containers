FROM docker.io/library/debian:12.5-slim@sha256:ccb33c3ac5b02588fc1d9e4fc09b952e433d0c54d8618d0ee1afadf1f3cf2455

# Versions of core components.
ARG VERSION_SONARR

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

# Sonarr
RUN curl --location --silent "https://github.com/Sonarr/Sonarr/releases/download/v${VERSION_SONARR}/Sonarr.main.${VERSION_SONARR}.linux-x64.tar.gz" --output "sonarr.tar.gz" \
  # Quietly unpack
  && tar xzf sonarr.tar.gz \
  && mv Sonarr /opt/sonarr

WORKDIR /opt/sonarr

ENTRYPOINT [ "/opt/sonarr" "-nobrowser", "-data=/var/lib/sonarr/" ]
