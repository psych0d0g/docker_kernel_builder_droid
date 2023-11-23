FROM archlinux:base-devel

RUN pacman --noconfirm -Sy \
    bc \
    cpio \
    git \
    zip \
    cpio \
    wget \
    python3 
