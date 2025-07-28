# Dockerfile
FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
    passwd \
    clang \
    llvm \
    llvm-dev \
    libelf-dev \
    linux-libc-dev \
    pkg-config \
    iproute2 \
    bpftool \
    bpfcc-tools \
    python3 \
    python3-bpfcc \
    python3-netaddr \
    iputils-ping \
    openssh-server \
    network-manager \
    linux-headers-arm64  \
    bcc \
    cmake \
    bash \
    git \
    nano \
    sudo \
 && rm -rf /var/lib/apt/lists/*



WORKDIR /root/ebpf

ENTRYPOINT ["/bin/bash"]