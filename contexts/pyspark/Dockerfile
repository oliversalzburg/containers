FROM docker.io/library/debian:12.5-slim@sha256:155280b00ee0133250f7159b567a07d7cd03b1645714c3a7458b2287b0ca83cb

WORKDIR /tmp

# Versions of core components.
ARG VERSION_PYSPARK
ARG VERSION_PYTEST

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

# renovate: datasource=repology depName=debian_12/ca-certificates versioning=deb
ENV VERSION_CA_CERTIFICATES="20230311"
# renovate: datasource=repology depName=debian_12/git versioning=deb
ENV VERSION_GIT="1:2.39.2-1.1"
# renovate: datasource=repology depName=debian_12/openjdk-17 versioning=deb
ENV VERSION_OPEN_JDK="17.0.11+9-1~deb12u1"
# renovate: datasource=repology depName=debian_12/python3 versioning=deb
ENV VERSION_PYTHON3="3.11.2-1+b1"
# renovate: datasource=repology depName=debian_12/python3-pandas versioning=deb
ENV VERSION_PYTHON3_PANDAS="1.5.3+dfsg-2"
# renovate: datasource=repology depName=debian_12/python3-pip versioning=deb
ENV VERSION_PYTHON3_PIP="23.0.1+dfsg-1"
# renovate: datasource=repology depName=debian_12/pipx versioning=deb
ENV VERSION_PYTHON3_PIPX="1.1.0-1"

# Install as much as possible from APT.
RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${VERSION_CA_CERTIFICATES} \
  git=${VERSION_GIT} \
  pipx=${VERSION_PYTHON3_PIPX} \
  openjdk-17-jdk=${VERSION_OPEN_JDK} \
  python3=${VERSION_PYTHON3} \
  python3-pandas=${VERSION_PYTHON3_PANDAS} \
  python3-pip=${VERSION_PYTHON3_PIP} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install unpublished packages from pipx.
RUN pipx install pyspark==${VERSION_PYSPARK} \
  && pipx install pytest==${VERSION_PYTEST} \
  && pipx ensurepath

WORKDIR /
