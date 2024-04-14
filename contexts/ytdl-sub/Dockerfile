FROM docker.io/library/debian:12.5-slim@sha256:3d5df92588469a4c503adbead0e4129ef3f88e223954011c2169073897547cac

# Versions of core components.
ARG VERSION_YTDLSUB

WORKDIR /tmp

# renovate: datasource=repology depName=debian_12/ca-certificates versioning=loose
ENV VERSION_CA_CERTIFICATES="20230311"
# renovate: datasource=repology depName=debian_12/curl versioning=loose
ENV VERSION_CURL="7.88.1-10+deb12u5"
# renovate: datasource=repology depName=debian_12/ffmpeg versioning=loose
ENV VERSION_FFMPEG="7:5.1.4-0+deb12u1"
# renovate: datasource=repology depName=debian_12/openssl versioning=loose
ENV VERSION_OPENSSL="3.0.11-1~deb12u2"
# renovate: datasource=repology depName=debian_12/python3-defaults versioning=loose
ENV VERSION_PYTHON3="3.11.2-1+b1"
# renovate: datasource=repology depName=debian_12/python-pip versioning=loose
ENV VERSION_PYTHON3_PIP="23.0.1+dfsg-1"
# renovate: datasource=repology depName=debian_12/python-pipx versioning=loose
ENV VERSION_PYTHON3_PIPX="1.1.0-1"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${VERSION_CA_CERTIFICATES} \
  curl=${VERSION_CURL} \
  ffmpeg=${VERSION_FFMPEG} \
  openssl=${VERSION_OPENSSL} \
  pipx=${VERSION_PYTHON3_PIPX} \
  python3=${VERSION_PYTHON3} \
  python3-pip=${VERSION_PYTHON3_PIP} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# ytdl-sub
RUN pipx install ytdl-sub==${VERSION_YTDLSUB} \
  && pipx ensurepath

WORKDIR /opt

CMD ["--help"]
ENTRYPOINT ["/root/.local/bin/ytdl-sub"]
