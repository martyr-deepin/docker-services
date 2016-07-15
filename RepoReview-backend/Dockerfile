FROM debian:jessie

RUN echo "deb [by-hash=force] http://pools.corp.deepin.com/deepin unstable main contrib non-free" > /etc/apt/sources.list

RUN apt-get update \
    && yes | apt-get install git \
    && yes | apt-get install vim \
    && yes | apt-get install python3 \
    && yes | apt-get install python3-pip \
    && yes | apt-get install openssh-server \ 
    && yes | apt-get install sudo

RUN mkdir -p /var/run/sshd \
    && useradd -m -G sudo deepin \
    && echo 'deepin:0' | chpasswd \
    && echo "deepin	ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY run.sh /usr/bin/run.sh

RUN yes | apt-get install locales
RUN sed -i "s/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g" /etc/locale.gen
RUN locale-gen
ENV LC_ALL=zh_CN.UTF-8

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

USER deepin
WORKDIR /data 
CMD ["bash", "/usr/bin/run.sh"]

