FROM ubuntu

LABEL Description="Ubuntu build/dev environment."

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
EXPOSE 5900
EXPOSE 22