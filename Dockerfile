FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

ARG UID

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && perl -pi -e 's/archive.ubuntu.com/us.archive.ubuntu.com/' /etc/apt/sources.list \
    && apt-get update -y

RUN apt-get -y install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip

RUN apt-get -y install vim

RUN apt-get -y install python-pip python-dev python

RUN apt-get -y install rsync

RUN useradd -ms /bin/bash vsoc -u $UID
USER vsoc
ENV HOME /home/vsoc

RUN echo "export USE_CCACHE=1" >> /home/vsoc/.bashrc

WORKDIR /home/vsoc
