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

RUN apt-get update && \
apt-get install -y libglu1-mesa && \
apt-get install -y sudo && \
apt-get install -y net-tools && \
apt-get install -y iputils-ping && \
apt-get install -y vim && \
apt-get install -y emacs && \
apt-get install -y python && \
apt-get install -y python-dev && \
apt-get install -y pyflakes && \
apt-get install -y scala && \
apt-get install -y g++ && \
apt-get install -y gcc && \
apt-get install -y gdb && \
apt-get install -y zlib1g-dev && \
apt-get install -y libboost-all-dev && \
apt-get install -y libssl-dev && \
apt-get install -y ssh && \
apt-get install -y eclipse && \
apt-get install -y netbeans && \
apt-get install -y git && \
apt-get install -y meld && \
apt-get install -y qgit && \
apt-get install -y make && \
apt-get install -y cmake && \
apt-get install -y xterm && \
apt-get install -y autoconf && \
apt-get install -y automake && \
apt-get install -y unzip && \
apt-get install -y libtool

ADD timezone /etc/
ENV TZ=America/New_York
ADD supervisord.conf /etc/supervisor/conf.d/
ENV HOME=/home/deepgrant
ENV PATH=${PATH}:${HOME}/bin
WORKDIR ${HOME}
ADD .bash_profile ${HOME}
ENTRYPOINT ["/startup.sh"]
