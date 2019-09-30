FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && perl -pi -e 's/archive.ubuntu.com/us.archive.ubuntu.com/' /etc/apt/sources.list \
    && apt-get update -y

RUN apt-get -y install apt-utils git ccache lzop bison gperf build-essential zip curl zlib1g-dev g++-multilib python-networkx libxml2-utils bzip2 libbz2-dev libghc-bzlib-dev squashfs-tools pngcrush liblz4-tool optipng libc6-dev-i386 gcc-multilib libssl-dev gnupg flex lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev xsltproc unzip python-pip python-dev libffi-dev libxml2-dev libxslt1-dev libjpeg8-dev openjdk-8-jdk

RUN apt-get -y install android-tools-adb bc imagemagick lib32readline-dev libncurses5-dev libsdl1.2-dev libwxgtk3.0-dev rsync schedtool xsltproc yasm  git-core python

RUN apt-get -y install vim

## FROM nsjail
RUN apt-get -y update && apt-get install -y \
    autoconf \
    bison \
    flex \
    gcc \
    g++ \
    git \
    libprotobuf-dev \
    libnl-route-3-dev \
    libtool \
    make \
    pkg-config \
    protobuf-compiler \
    && rm -rf /var/lib/apt/lists/*

COPY . /nsjail

RUN cd /nsjail && make && mv /nsjail/nsjail /bin && rm -rf -- /nsjail

## User devwindsw
RUN useradd -ms /bin/bash devwindsw
USER devwindsw
ENV HOME /home/devwindsw

RUN ln -sf /aosp /home/devwindsw/aosp

RUN mkdir /home/devwindsw/bin
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /home/devwindsw/bin/repo
RUN chmod a+x /home/devwindsw/bin/repo

RUN echo "PATH=/home/devwindsw/bin:$PATH" >> /home/devwindsw/.bashrc
RUN echo "export USE_CCACHE=1" >> /home/devwindsw/.bashrc

WORKDIR /home/devwindsw
