FROM ubuntu:18.04

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && perl -pi -e 's/archive.ubuntu.com/us.archive.ubuntu.com/' /etc/apt/sources.list \
    && apt-get update -y

RUN apt-get -y install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip

RUN apt-get -y install vim

RUN apt-get -y install rsync

RUN useradd -ms /bin/bash devwindsw
USER devwindsw
ENV HOME /home/devwindsw

RUN ln -sf /aosp /home/devwindsw/aosp

RUN mkdir /home/devwindsw/bin
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /home/devwindsw/bin/repo
RUN chmod a+x /home/devwindsw/bin/repo

RUN echo "PATH=/home/devwindsw/bin:$PATH" >> /home/devwindsw/.bashrc

WORKDIR /home/devwindsw

