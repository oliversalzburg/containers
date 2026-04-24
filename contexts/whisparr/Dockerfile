FROM docker.io/library/ubuntu:26.04@sha256:5e275723f82c67e387ba9e3c24baa0abdcb268917f276a0561c97bef9450d0b4

# Versions of core components.
ARG WHISPARR_VERSION

ENV CA_CERTIFICATES_VERSION="20241223"
ENV CURL_VERSION="8.12.1-3ubuntu1"
ENV ICU_VERSION="76.1-1ubuntu2"
ENV LIBSQLITE_VERSION="3.46.1-3ubuntu0.3"
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

# Whisparr
RUN curl --location --silent "https://whisparr.servarr.com/v1/update/nightly/updatefile?version=${WHISPARR_VERSION}&os=linux&runtime=netcore&arch=x64" --output "whisparr.tar.gz" \
  # Quietly unpack
  && tar xzf whisparr.tar.gz \
  && rm whisparr.tar.gz \
  && mv Whisparr /opt/whisparr

WORKDIR /opt/whisparr

ENTRYPOINT [ "/opt/whisparr/Whisparr", "-nobrowser", "-data=/var/lib/whisparr/" ]
