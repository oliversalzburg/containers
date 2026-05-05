FROM docker.io/library/ubuntu:26.04@sha256:f3d28607ddd78734bb7f71f117f3c6706c666b8b76cbff7c9ff6e5718d46ff64

# Versions of core components.
ARG WHISPARR_VERSION

ENV CA_CERTIFICATES_VERSION="20260223"
ENV CURL_VERSION="8.18.0-1ubuntu2"
ENV ICU_VERSION="78.2-2ubuntu1"
ENV LIBSQLITE_VERSION="3.46.1-9"
ENV OPENSSL_VERSION="3.5.5-1ubuntu3"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  curl=${CURL_VERSION} \
  libicu78=${ICU_VERSION} \
  libsqlite3-0=${LIBSQLITE_VERSION} \
  openssl=${OPENSSL_VERSION} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Whisparr
RUN curl --location --silent "https://github.com/Whisparr/Whisparr/releases/download/v${WHISPARR_VERSION}/Whisparr.${WHISPARR_VERSION}.linux-x64.tar.gz" --output "whisparr.tar.gz" \
  # Quietly unpack
  && tar xzf whisparr.tar.gz \
  && rm whisparr.tar.gz \
  && mv Whisparr /opt/whisparr
WORKDIR /opt/whisparr

ENTRYPOINT [ "/opt/whisparr/Whisparr", "-nobrowser", "-data=/var/lib/whisparr/" ]
