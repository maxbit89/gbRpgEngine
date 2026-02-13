# Debian base
FROM debian:trixie

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m -s /bin/bash $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


# Set non-interactive frontend for apt
#ENV DEBIAN_FRONTEND=noninteractive
#ENV DEVKITPRO=/opt/devkitpro
#ENV DEVKITPPC=$DEVKITPRO/devkitPPC
#ENV DEVKITARM=$DEVKITPRO/devkitARM
#ENV PATH=$DEVKITPPC/bin:$DEVKITARM/bin:$PATH
#ENV BUILD_DKPRO_INSTALLDIR=$DEVKITPRO

# Basic build deps
RUN apt-get update
RUN apt-get install -y \
    build-essential \
    git \
    wget \
    unzip \
    cmake \
    pkg-config \
    autoconf \
    automake \
    libtool \
    texinfo \
    patch \
    libgmp-dev \
    libmpfr-dev \
    libmpc-dev \
    libfreeimage-dev \
    zlib1g-dev \
    libusb-dev \
    libudev-dev \
    libexpat1-dev \
    mesa-common-dev \
    libasound2-dev \
    libogg-dev \
    libvorbis-dev \
    pkg-config \
    python3 \
    python3-pip \
    zip \
    ninja-build \
    libbz2-dev \
    liblzma-dev

# Fix mount table for pacman
RUN ln -sf /proc/self/mounts /etc/mtab

#install devkitpro
RUN cd /tmp && wget -U "dkp-apt" https://apt.devkitpro.org/install-devkitpro-pacman
RUN chmod +x /tmp/install-devkitpro-pacman
RUN yes | /tmp/install-devkitpro-pacman
#RUN dkp-pacman-key --init && dkp-pacman-key --populate devkitpro
#RUN dkp-pacman -Sy --noconfirm
#RUN dkp-pacman -S --noconfirm gba-dev nds-dev 3ds-dev gamecube-dev wii-dev wiiu-dev switch-dev gp32-dev gp2x-dev
#RUN dkp-pacman -Sy --noconfirm && dkp-pacman -S --noconfirm gba-dev nds-dev 3ds-dev gamecube-dev wii-dev wiiu-dev switch-dev gp32-dev gp2x-dev
RUN dkp-pacman-key --init && \
    dkp-pacman-key --populate devkitpro && \
    dkp-pacman -Syu --noconfirm && \
    dkp-pacman -S --noconfirm gba-dev

#Clean up apt cache
#RUN apt-get clean \
# && rm -rf /var/lib/apt/lists/*

#Install vulcane
#todo

#Install octave game engine
#RUN git clone --recursive https://github.com/mholtkamp/octave.git /opt/octave-src \
# && cd /opt/octave-src \
# (Optional) check out a stable tag or branch
# && git checkout main \
# && mkdir build && cd build \
# && cmake .. -DCMAKE_BUILD_TYPE=Release \
# && make -j$(nproc) \
# && make install \
# && cd / \
# && rm -rf /opt/octave-src

USER $USERNAME
WORKDIR /workspaces
