FROM docker.io/library/debian:12.5-slim@sha256:155280b00ee0133250f7159b567a07d7cd03b1645714c3a7458b2287b0ca83cb

# Versions of core components.
ARG VERSION_YTDLSUB

WORKDIR /tmp

# renovate: datasource=repology depName=debian_12/ca-certificates versioning=deb
ENV VERSION_CA_CERTIFICATES="20230311"
# renovate: datasource=repology depName=debian_12/curl versioning=deb
ENV VERSION_CURL="7.88.1-10+deb12u5"
# renovate: datasource=repology depName=debian_12/ffmpeg versioning=deb
ENV VERSION_FFMPEG="7:5.1.4-0+deb12u1"
# renovate: datasource=repology depName=debian_12/openssl versioning=deb
ENV VERSION_OPENSSL="3.0.11-1~deb12u2"
# renovate: datasource=repology depName=debian_12/python3 versioning=deb
ENV VERSION_PYTHON3="3.11.2-1+b1"
# renovate: datasource=repology depName=debian_12/python3-pip versioning=deb
ENV VERSION_PYTHON3_PIP="23.0.1+dfsg-1"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${VERSION_CA_CERTIFICATES} \
  curl=${VERSION_CURL} \
  ffmpeg=${VERSION_FFMPEG} \
  openssl=${VERSION_OPENSSL} \
  python3=${VERSION_PYTHON3} \
  python3-pip=${VERSION_PYTHON3_PIP} \
  sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# ytdl-sub
RUN python3 -m pip install -U --break-system-packages ytdl-sub==${VERSION_YTDLSUB}

WORKDIR /config

CMD ["--help"]
ENTRYPOINT ["/usr/local/bin/ytdl-sub"]
