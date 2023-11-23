FROM archlinux:base-devel

RUN pacman --noconfirm -Sy \
    busybox \
    bc \
    bash \
    cpio \
    git \
    zip \
    cpio \
    wget \
    python3 

RUN mkdir -o /tmp/antman
ADD https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman /tmp/antman/antman

RUN chmod +x /tmp/antman/antman
RUN /tmp/antman/antman -S
