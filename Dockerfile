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

RUN ln -s /usr/bin/bash /bin/bash

ADD https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman /usr/local/bin/antman

RUN chmod +x /usr/local/bin/antman
RUN /usr/local/bin/antman -S
