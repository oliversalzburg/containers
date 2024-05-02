FROM docker.io/library/debian:12.5-slim@sha256:155280b00ee0133250f7159b567a07d7cd03b1645714c3a7458b2287b0ca83cb

WORKDIR /tmp

# Versions of core components.
ARG PYSPARK_VERSION
ARG PYTEST_VERSION

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

# renovate: datasource=repology depName=debian_12/ca-certificates
ENV CA_CERTIFICATES_VERSION="20230311"
# renovate: datasource=repology depName=debian_12/git versioning=deb
ENV GIT_VERSION="1:2.39.2-1.1"
# renovate: datasource=repology depName=debian_12/openjdk-17 versioning=deb
ENV OPEN_JDK_VERSION="17.0.11+9-1~deb12u1"
# renovate: datasource=repology depName=debian_12/python3 versioning=deb
ENV PYTHON3_VERSION="3.11.2-1+b1"
# renovate: datasource=repology depName=debian_12/python3-pandas versioning=deb
ENV PYTHON3_PANDAS_VERSION="1.5.3+dfsg-2"
# renovate: datasource=repology depName=debian_12/python3-pip versioning=deb
ENV PYTHON3_PIP_VERSION="23.0.1+dfsg-1"
# renovate: datasource=repology depName=debian_12/pipx versioning=deb
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
