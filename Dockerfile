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

RUN mkdir -p /opt/antman
RUN mkdir -p /opt/toolchains/neutron-clang

ADD https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman /opt/antman/antman

RUN chmod +x /opt/antman/antman
RUN cd /opt/toolchains/neutron-clang && /opt/antman/antman -S

ENV PATH=/opt/toolchains/neutron-clang/bin:$PATH