# Dockerfile
FROM alpine:latest

# install eBPF essentials:
#   - build-base    : gcc, make, libc-dev
#   - clang/llvm    : compile C → BPF bytecode
#   - llvm-dev      : LLVM headers & libs
#   - elfutils-dev  : libelf & headers (for .o parsing)
#   - linux-headers : host kernel .h files for BPF verifier
#   - pkgconfig     : pkg-config support
#   - iproute2      : 'ip link', 'tc' for attaching BPF
#   - bpftool       : bpf tool from kernel source
#   - bcc-tools     : BPF Compiler Collection tools & Python bindings
#   - python3       : Python 3 interpreter for BCC scripts
#   - cmake, bash, git : for building libbpf/examples, cloning repos, scripting
RUN apk update && apk add --no-cache \
    build-base \
    clang \
    llvm \
    llvm-dev \
    elfutils-dev \
    linux-headers \
    pkgconfig \
    iproute2 \
    bpftool \
    bcc-tools \
    python3 \
    cmake \
    bash \
    git \
    nano \
    sudo			

    
# the folder inside the container that you will put your files 
# (this folder is a bind of "data" folder in your host)
WORKDIR /root/ebpf




ENTRYPOINT ["/bin/bash"]
