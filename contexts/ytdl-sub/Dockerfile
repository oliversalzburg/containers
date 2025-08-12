FROM docker.io/library/ubuntu:noble@sha256:7c06e91f61fa88c08cc74f7e1b7c69ae24910d745357e0dfe1d2c0322aaf20f9

# Versions of core components.
ARG YTDLSUB_VERSION

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/ca-certificates versioning=deb
ENV CA_CERTIFICATES_VERSION="20240203"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/universe/ffmpeg versioning=deb
ENV FFMPEG_VERSION="7:6.1.1-3ubuntu5"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/openssl versioning=deb
ENV OPENSSL_VERSION="3.0.13-0ubuntu3.5"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/python3 versioning=deb
ENV PYTHON3_VERSION="3.12.3-0ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/universe/python3-pip versioning=deb
ENV PYTHON3_PIP_VERSION="24.0+dfsg-1ubuntu1.2"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  ffmpeg=${FFMPEG_VERSION} \
  openssl=${OPENSSL_VERSION} \
  python3=${PYTHON3_VERSION} \
  python3-pip=${PYTHON3_PIP_VERSION} \
  sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# ytdl-sub
RUN python3 -m pip install -U --break-system-packages ytdl-sub==${YTDLSUB_VERSION}

WORKDIR /config

CMD ["--help"]
ENTRYPOINT ["/usr/local/bin/ytdl-sub"]
