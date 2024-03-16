FROM docker.io/library/debian:12.5-slim@sha256:d02c76d82364cedca16ba3ed6f9102406fa9fa8833076a609cabf14270f43dfc

# Versions of core components.
ARG VERSION_AWS_CLI
ARG VERSION_PYTHON
ARG VERSION_TERRAFORM
ARG JOBS=2

WORKDIR /tmp

# renovate: datasource=repology depName=debian_12/ca-certificates versioning=loose
ENV VERSION_CA_CERTIFICATES="20230311"
# renovate: datasource=repology depName=debian_12/curl versioning=loose
ENV VERSION_CURL="7.88.1-10+deb12u5"
# renovate: datasource=repology depName=debian_12/g++ versioning=loose
ENV VERSION_GPP="4:12.2.0-3"
# renovate: datasource=repology depName=debian_12/gcc versioning=loose
ENV VERSION_GCC="4:12.2.0-3"
# renovate: datasource=repology depName=debian_12/git versioning=loose
ENV VERSION_GIT="1:2.39.2-1.1"
# renovate: datasource=repology depName=debian_12/jq versioning=loose
ENV VERSION_JQ="1.6-2.1"
# renovate: datasource=repology depName=debian_12/glibc versioning=loose
ENV VERSION_LIBC="2.36-9+deb12u4"
# renovate: datasource=repology depName=debian_12/libffi-dev versioning=loose
ENV VERSION_LIBFFI="3.4.4-1"
# renovate: datasource=repology depName=debian_12/libbz2-dev versioning=loose
ENV VERSION_LIBBZ2="1.0.8-5+b1"
# renovate: datasource=repology depName=debian_12/libgdbm-compat-dev versioning=loose
ENV VERSION_LIBGDBM="1.23-3"
# renovate: datasource=repology depName=debian_12/liblzma-dev versioning=loose
ENV VERSION_LIBLZMA="5.4.1-0.2"
# renovate: datasource=repology depName=debian_12/libncurses-dev versioning=loose
ENV VERSION_LIBNCURSES="6.4-4"
# renovate: datasource=repology depName=debian_12/libreadline-dev versioning=loose
ENV VERSION_LIBREADLINE="8.2-1.3"
# renovate: datasource=repology depName=debian_12/libsqlite3-dev versioning=loose
ENV VERSION_LIBSQLLITE3="3.40.1-2"
# renovate: datasource=repology depName=debian_12/make-dfsg versioning=loose
ENV VERSION_MAKE="4.3-4.1"
# renovate: datasource=repology depName=debian_12/openssl versioning=loose
ENV VERSION_OPENSSL="3.0.11-1~deb12u2"
# renovate: datasource=repology depName=debian_12/sqlite3 versioning=loose
ENV VERSION_SQLITE3="3.40.1-2"
# renovate: datasource=repology depName=debian_12/tk-dev versioning=loose
ENV VERSION_TK="8.6.13"
# renovate: datasource=repology depName=debian_12/unzip versioning=loose
ENV VERSION_UNZIP="6.0-28"
# renovate: datasource=repology depName=debian_12/uuid-dev versioning=loose
ENV VERSION_UUID="2.38.1-5+b1"
# renovate: datasource=repology depName=debian_12/zlib versioning=loose
ENV VERSION_ZLIB="1:1.2.13.dfsg-1"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${VERSION_CA_CERTIFICATES} \
  curl=${VERSION_CURL} \
  g++=${VERSION_GPP} \
  gcc=${VERSION_GCC} \
  git=${VERSION_GIT} \
  jq=${VERSION_JQ} \
  libc6-dev=${VERSION_LIBC} \
  libffi-dev=${VERSION_LIBFFI} \
  libbz2-dev=${VERSION_LIBBZ2} \
  libgdbm-compat-dev=${VERSION_LIBGDBM} \
  liblzma-dev=${VERSION_LIBLZMA} \
  libncurses-dev=${VERSION_LIBNCURSES} \
  libreadline-dev=${VERSION_LIBREADLINE} \
  libsqlite3-dev=${VERSION_LIBSQLLITE3} \
  libssl3=${VERSION_OPENSSL} \
  libssl-dev=${VERSION_OPENSSL} \
  make=${VERSION_MAKE} \
  openssl=${VERSION_OPENSSL} \
  sqlite3=${VERSION_SQLITE3} \
  tk-dev=${VERSION_TK} \
  unzip=${VERSION_UNZIP} \
  uuid-dev=${VERSION_UUID} \
  zlib1g-dev=${VERSION_ZLIB} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# AWS CLI
RUN curl --silent "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${VERSION_AWS_CLI}.zip" --output "awscliv2.zip" \
  # Quietly unzip
  && unzip -q awscliv2.zip \
  && ./aws/install \
  # Delete temporary data
  && rm -rf ./awscliv2.zip ./aws \
  # Print installed version
  && aws --version

# Python
# hadolint ignore=DL3003
RUN curl --silent "https://www.python.org/ftp/python/${VERSION_PYTHON}/Python-${VERSION_PYTHON}.tgz" --output "python3.tgz" \
  # Quietly untar
  && tar xzf python3.tgz \
  # Build and install
  && cd "Python-${VERSION_PYTHON}" \
  && ./configure --enable-optimizations --with-ensurepip=install \
  && make --jobs ${JOBS} \
  && make install \
  # Register `pip3` as global `pip`
  && ln -s /usr/local/bin/pip3 /usr/local/bin/pip \
  && cd .. \
  # Delete temporary data
  && rm -rf ./python3.tgz "./Python-${VERSION_PYTHON}" \
  # Print installed version
  && python3 --version \
  && pip --version

# Terraform
RUN curl --silent "https://releases.hashicorp.com/terraform/${VERSION_TERRAFORM}/terraform_${VERSION_TERRAFORM}_linux_amd64.zip" --output "terraform.zip" && \
  # Quietly unzip
  unzip -q terraform.zip && \
  mv terraform /usr/bin/terraform && \
  # Delete temporary data
  rm -rf ./terraform.zip && \
  # Print installed version
  terraform --version

WORKDIR /
