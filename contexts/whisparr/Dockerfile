FROM docker.io/library/ubuntu:plucky-20250925.1@sha256:61715ab46e7ffac134f0687b9d96826db4e2759e56b00ffd7907c5bf38a9035a

# Versions of core components.
ARG WHISPARR_VERSION

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/ca-certificates versioning=deb
ENV CA_CERTIFICATES_VERSION="20240203"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/curl versioning=deb
ENV CURL_VERSION="8.5.0-2ubuntu10.6"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/libicu74 versioning=deb
ENV ICU_VERSION="74.2-1ubuntu3.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/libsqlite3-0 versioning=deb
ENV LIBSQLITE_VERSION="3.45.1-1ubuntu2.5"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/plucky/main/openssl versioning=deb
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

# Whisparr
RUN curl --location --silent "https://whisparr.servarr.com/v1/update/nightly/updatefile?version=${WHISPARR_VERSION}&os=linux&runtime=netcore&arch=x64" --output "whisparr.tar.gz" \
  # Quietly unpack
  && tar xzf whisparr.tar.gz \
  && rm whisparr.tar.gz \
  && mv Whisparr /opt/whisparr

WORKDIR /opt/whisparr

ENTRYPOINT [ "/opt/whisparr/Whisparr", "-nobrowser", "-data=/var/lib/whisparr/" ]
