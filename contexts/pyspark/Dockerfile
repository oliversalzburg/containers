FROM docker.io/library/debian:12.5-slim@sha256:804194b909ef23fb995d9412c9378fb3505fe2427b70f3cc425339e48a828fca

WORKDIR /tmp

# Versions of core components.
ARG PYSPARK_VERSION
ARG PYTEST_VERSION

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/ca-certificates
ENV CA_CERTIFICATES_VERSION="20230311"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/git
ENV GIT_VERSION="1:2.39.2-1.1"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/openjdk-17-jdk
ENV OPEN_JDK_VERSION="17.0.11+9-1~deb12u1"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/python3
ENV PYTHON3_VERSION="3.11.2-1+b1"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/python3-pandas
ENV PYTHON3_PANDAS_VERSION="1.5.3+dfsg-2"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/python3-pip
ENV PYTHON3_PIP_VERSION="23.0.1+dfsg-1"
# renovate: datasource=custom.apt.debian depName=debian-observable/bookworm/main/pipx
ENV PYTHON3_PIPX_VERSION="1.1.0-1"

# Install as much as possible from APT.
RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  git=${GIT_VERSION} \
  pipx=${PYTHON3_PIPX_VERSION} \
  openjdk-17-jdk=${OPEN_JDK_VERSION} \
  python3=${PYTHON3_VERSION} \
  python3-pandas=${PYTHON3_PANDAS_VERSION} \
  python3-pip=${PYTHON3_PIP_VERSION} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install unpublished packages from pipx.
RUN pipx install pyspark==${PYSPARK_VERSION} \
  && pipx install pytest==${PYTEST_VERSION} \
  && pipx ensurepath

WORKDIR /
