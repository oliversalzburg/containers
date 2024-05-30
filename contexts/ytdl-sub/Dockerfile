FROM docker.io/library/ubuntu:noble@sha256:3f85b7caad41a95462cf5b787d8a04604c8262cdcdf9a472b8c52ef83375fe15

# Versions of core components.
ARG YTDLSUB_VERSION

WORKDIR /tmp

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/ca-certificates versioning=deb
ENV CA_CERTIFICATES_VERSION="20230311"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/curl versioning=deb
ENV CURL_VERSION="8.5.0-2ubuntu10.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/ffmpeg versioning=deb
ENV FFMPEG_VERSION="7:5.1.4-0+deb12u1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/openssl versioning=deb
ENV OPENSSL_VERSION="3.0.11-1~deb12u2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/python3 versioning=deb
ENV PYTHON3_VERSION="3.11.2-1+b1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/python3-pip versioning=deb
ENV PYTHON3_PIP_VERSION="23.0.1+dfsg-1"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  curl=${CURL_VERSION} \
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
