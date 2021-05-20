FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 && \
    apt-get -y update && \
    apt-get -y install --no-install-recommends \
        git vim parted \
        quilt coreutils qemu-user-static:i386 debootstrap zerofree zip dosfstools \
        bsdtar libcap2-bin rsync grep udev xz-utils curl xxd file kmod bc \
        binfmt-support ca-certificates \
        gnupg \
    && rm -rf /var/lib/apt/lists/*

ADD https://ltsp.org/misc/ltsp-ubuntu-ppa-focal.list /etc/apt/sources.list.d/ltsp-ubuntu-ppa-focal.list
ADD https://ltsp.org/misc/ltsp_ubuntu_ppa.gpg /tmp/ltsp_ubuntu_ppa.gpg
RUN apt-key add /tmp/ltsp_ubuntu_ppa.gpg

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends ltsp squashfs-tools


#COPY . /pi-gen/

#VOLUME [ "/pi-gen/work", "/pi-gen/deploy"]

#VOLUME /pi-gen
