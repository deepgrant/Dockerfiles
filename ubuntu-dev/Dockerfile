FROM ubuntu:17.04

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
RUN apt-get install -y scala
RUN apt-get install -y gradle
RUN apt-get install -y maven
RUN apt-get install -y ivy
RUN apt-get install -y g++ gcc gdb
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y ssh
RUN apt-get install -y git
RUN apt-get install -y make cmake autoconf automake
RUN apt-get install -y unzip
RUN apt-get install -y libtool
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y lsof

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install virtualenv

COPY requirements.txt /tmp
RUN pip install --requirement /tmp/requirements.txt

RUN dpkg-reconfigure -f noninteractive tzdata
RUN date

RUN export UserName="deepgrant" uid=501 gid=20 && \
    mkdir -p /home/${UserName} && \
    echo "${UserName}:x:${uid}:${gid}:${UserName},,,:/home/${UserName}:/bin/bash" >> /etc/passwd && \
    echo "${UserName}:x:${uid}:" >> /etc/group && \
    echo "${UserName} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UserName} && \
    chmod 0440 /etc/sudoers.d/${UserName} && \
    chown ${uid}:${gid} -R /home/${UserName}

USER deepgrant
ENV HOME=/home/deepgrant
ENV PATH=${PATH}:${HOME}/bin
WORKDIR ${HOME}
