FROM docker.io/library/debian:12.5-slim@sha256:804194b909ef23fb995d9412c9378fb3505fe2427b70f3cc425339e48a828fca

# Versions of core components.
ARG YTDLSUB_VERSION

WORKDIR /tmp

# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/ca-certificates
ENV CA_CERTIFICATES_VERSION="20230311"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/curl
ENV CURL_VERSION="7.88.1-10+deb12u5"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/ffmpeg
ENV FFMPEG_VERSION="7:5.1.4-0+deb12u1"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/openssl
ENV OPENSSL_VERSION="3.0.11-1~deb12u2"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/python3
ENV PYTHON3_VERSION="3.11.2-1+b1"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/python3-pip
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
