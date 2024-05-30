FROM docker.io/library/ubuntu:noble@sha256:3f85b7caad41a95462cf5b787d8a04604c8262cdcdf9a472b8c52ef83375fe15

# Versions of core components.
ARG AWS_CLI_VERSION
ARG OPENTOFU_VERSION
ARG PYTHON_VERSION
ARG TERRAFORM_VERSION

# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/ca-certificates versioning=deb
ENV CA_CERTIFICATES_VERSION="20240203"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/curl versioning=deb
ENV CURL_VERSION="8.5.0-2ubuntu10.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/g++ versioning=deb
ENV GPP_VERSION="4:13.2.0-7ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/gcc versioning=deb
ENV GCC_VERSION="4:13.2.0-7ubuntu1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/git versioning=deb
ENV GIT_VERSION="1:2.43.0-1ubuntu7.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/jq versioning=deb
ENV JQ_VERSION="1.7.1-3build1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libc6-dev versioning=deb
ENV LIBC_VERSION="2.39-0ubuntu8.2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libffi-dev versioning=deb
ENV LIBFFI_VERSION="3.4.6-1build1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libbz2-dev versioning=deb
ENV LIBBZ2_VERSION="1.0.8-5.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libgdbm-compat-dev versioning=deb
ENV LIBGDBM_VERSION="1.23-5.1build1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/liblzma-dev versioning=deb
ENV LIBLZMA_VERSION="5.6.1+really5.4.5-1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libncurses-dev versioning=deb
ENV LIBNCURSES_VERSION="6.4+20240113-1ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libreadline-dev versioning=deb
ENV LIBREADLINE_VERSION="8.2-4build1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/libsqlite3-dev versioning=deb
ENV LIBSQLLITE3_VERSION="3.45.1-1ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/make versioning=deb
ENV MAKE_VERSION="4.3-4.1build2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/openssl versioning=deb
ENV OPENSSL_VERSION="3.0.13-0ubuntu3.1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/sqlite3 versioning=deb
ENV SQLITE3_VERSION="3.45.1-1ubuntu2"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/tk-dev versioning=deb
ENV TK_VERSION="8.6.14build1"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/unzip versioning=deb
ENV UNZIP_VERSION="6.0-28ubuntu4"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/util-linux versioning=deb
ENV UUID_VERSION="2.39.3-9ubuntu6"
# renovate: datasource=custom.apt.ubuntu depName=ubuntu-observable/noble/main/zlib1g-dev versioning=deb
ENV ZLIB_VERSION="1:1.3.dfsg-3.1ubuntu2"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
  ca-certificates=${CA_CERTIFICATES_VERSION} \
  curl=${CURL_VERSION} \
  g++=${GPP_VERSION} \
  gcc=${GCC_VERSION} \
  git=${GIT_VERSION} \
  jq=${JQ_VERSION} \
  libc6-dev=${LIBC_VERSION} \
  libffi-dev=${LIBFFI_VERSION} \
  libbz2-dev=${LIBBZ2_VERSION} \
  libgdbm-compat-dev=${LIBGDBM_VERSION} \
  liblzma-dev=${LIBLZMA_VERSION} \
  libncurses-dev=${LIBNCURSES_VERSION} \
  libreadline-dev=${LIBREADLINE_VERSION} \
  libsqlite3-dev=${LIBSQLLITE3_VERSION} \
  libssl3=${OPENSSL_VERSION} \
  libssl-dev=${OPENSSL_VERSION} \
  make=${MAKE_VERSION} \
  openssl=${OPENSSL_VERSION} \
  sqlite3=${SQLITE3_VERSION} \
  tk-dev=${TK_VERSION} \
  unzip=${UNZIP_VERSION} \
  uuid-dev=${UUID_VERSION} \
  zlib1g-dev=${ZLIB_VERSION} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# AWS CLI
RUN curl --silent "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" --output "awscliv2.zip" \
  # Quietly unzip
  && unzip -q awscliv2.zip \
  && ./aws/install \
  # Delete temporary data
  && rm -rf ./awscliv2.zip ./aws \
  # Print installed version
  && aws --version

# OpenTofu
RUN curl --location --silent "https://github.com/opentofu/opentofu/releases/download/v${OPENTOFU_VERSION}/tofu_${OPENTOFU_VERSION}_linux_amd64.zip" --output "opentofu.zip" && \
  # Quietly unzip
  unzip -q opentofu.zip && \
  mv tofu /usr/bin/tofu && \
  # Delete temporary data
  rm -rf ./opentofu.zip && \
  # Print installed version
  tofu --version

# Python
# hadolint ignore=DL3003
RUN curl --silent "https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz" --output "python3.tgz" \
  # Quietly untar
  && tar xzf python3.tgz \
  # Build and install
  && cd "Python-${PYTHON_VERSION}" \
  && ./configure --enable-optimizations --with-ensurepip=install \
  && make --jobs $(nproc --all) \
  && make install \
  # Register `pip3` as global `pip`
  && ln -s /usr/local/bin/pip3 /usr/local/bin/pip \
  && cd .. \
  # Delete temporary data
  && rm -rf ./python3.tgz "./Python-${PYTHON_VERSION}" \
  # Print installed version
  && python3 --version \
  && pip --version

# Terraform
RUN curl --silent "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" --output "terraform.zip" && \
  # Quietly unzip
  unzip -q terraform.zip && \
  mv terraform /usr/bin/terraform && \
  # Delete temporary data
  rm -rf ./terraform.zip && \
  # Print installed version
  terraform --version

WORKDIR /
