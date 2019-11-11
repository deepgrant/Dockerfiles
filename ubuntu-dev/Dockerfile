FROM ubuntu:20.04

ARG UserName

LABEL Description="Ubuntu build/dev environment."

RUN apt-get update && apt-get install -y apt-transport-https

# Set the timezone.
ENV TZ=America/New_York
RUN apt-get install -y tzdata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y libglu1-mesa
RUN apt-get install -y sudo
RUN apt-get install -y net-tools
RUN apt-get install -y iputils-ping
RUN apt-get install -y vim
RUN apt-get install -y python
RUN apt-get install -y python-setuptools python-dev build-essential
RUN apt-get install -y ssh
RUN apt-get install -y git
RUN apt-get install -y make cmake autoconf automake
RUN apt-get install -y unzip
RUN apt-get install -y libtool
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y lsof

RUN apt-get install -y man
RUN apt-get install -y ffmpeg
RUN apt-get install -y libjson-xs-perl
RUN apt-get install -y libwww-perl
RUN apt-get install -y libxml2 libxml2-dev xml2
RUN apt-get install -y libparse-cpan-packages-perl
RUN apt-get install -y libconfig-yaml-perl

RUN cpan App::cpanminus
RUN cpan install XML::LibXML
RUN cpan XML::Simple

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install virtualenv

COPY requirements.txt /tmp
RUN pip install --requirement /tmp/requirements.txt

RUN dpkg-reconfigure -f noninteractive tzdata
RUN date

RUN export HOME=/home/${UserName} uid=501 gid=20 && \
    mkdir -p ${HOME} && \
    echo "${UserName}:x:${uid}:${gid}:${UserName},,,:${HOME}:/bin/bash" >> /etc/passwd && \
    echo "${UserName}:x:${uid}:" >> /etc/group && \
    echo "${UserName} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UserName} && \
    chmod 0440 /etc/sudoers.d/${UserName} && \
    chown ${uid}:${gid} -R ${HOME}

USER ${UserName}
ENV HOME=/home/${UserName}
ENV PATH=${PATH}:/home/${UserName}/bin
WORKDIR /home/${UserName}
