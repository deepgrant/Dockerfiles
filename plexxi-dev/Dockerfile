FROM ubuntu:latest

LABEL Description="Ubuntu build/dev environment."

RUN apt-get update && apt-get install -y apt-transport-https

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

RUN apt-get update && \
apt-get install -y libglu1-mesa && \
apt-get install -y sudo && \
apt-get install -y net-tools && \
apt-get install -y iputils-ping && \
apt-get install -y vim && \
apt-get install -y python && \
apt-get install -y pylint && \
apt-get install -y pyflakes && \
apt-get install -y ssh && \
apt-get install -y git && \
apt-get install -y unzip && \
apt-get install -y wget && \
apt-get install -y python-setuptools python-dev build-essential && \
apt-get install -y alembic && \
apt-get install -y postgresql-client-9.5

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install falcon
RUN pip install jsonschema
RUN pip install jsonpatch
RUN pip install psycopg2
RUN pip install bcrypt
RUN pip install mock
RUN pip install greenlet

RUN export UserName="plexxidev" uid=501 gid=20 && \
    mkdir -p /home/${UserName} && \
    echo "${UserName}:x:${uid}:${gid}:${UserName},,,:/home/${UserName}:/bin/bash" >> /etc/passwd && \
    echo "${UserName}:x:${uid}:" >> /etc/group && \
    echo "${UserName} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UserName} && \
    chmod 0440 /etc/sudoers.d/${UserName} && \
    chown ${uid}:${gid} -R /home/${UserName}

USER plexxidev
ENV HOME=/home/plexxidev
ENV PATH=${PATH}:${HOME}/bin
WORKDIR ${HOME}
EXPOSE 22



