FROM dorowu/ubuntu-desktop-lxde-vnc

LABEL Description="Ubuntu build/dev environment."

MAINTAINER deepgrant

RUN export UserName="deepgrant" uid=501 gid=20 && \
    mkdir -p /home/${UserName} && \
    echo "${UserName}:x:${uid}:${gid}:${UserName},,,:/home/${UserName}:/bin/bash" >> /etc/passwd && \
    echo "${UserName}:x:${uid}:" >> /etc/group && \
    echo "${UserName} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UserName} && \
    chmod 0440 /etc/sudoers.d/${UserName} && \
    chown ${uid}:${gid} -R /home/${UserName}

RUN apt-get update
RUN apt-get install -y libglu1-mesa
RUN apt-get install -y sudo
RUN apt-get install -y net-tools
RUN apt-get install -y iputils-ping
RUN apt-get install -y vim
RUN apt-get install -y emacs
RUN apt-get install -y python
RUN apt-get install -y scala
RUN apt-get install -y g++
RUN apt-get install -y gcc
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y ssh
RUN apt-get install -y eclipse
RUN apt-get install -y netbeans
RUN apt-get install -y git
RUN apt-get install -y meld
RUN apt-get install -y qgit
RUN apt-get install -y make
RUN apt-get install -y cmake
RUN apt-get install -y xterm
RUN apt-get install -y autoconf
RUN apt-get install -y automake
RUN apt-get install -y unzip
RUN apt-get install -y libtool

ADD timezone /etc/
ENV TZ=America/New_York
ADD supervisord.conf /etc/supervisor/conf.d/
ENV HOME=/home/deepgrant
ENV PATH=${PATH}:${HOME}/bin
WORKDIR ${HOME}
ADD .bash_profile ${HOME}
ENTRYPOINT ["/startup.sh"]
