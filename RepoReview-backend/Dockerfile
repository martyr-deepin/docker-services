FROM hub.deepin.io/debian:sid

RUN echo "deb [by-hash=force] http://pools.corp.deepin.com/deepin unstable main contrib non-free" > /etc/apt/sources.list

RUN apt-get update \
    && yes | apt-get install --no-install-recommends --no-install-suggests \
       git vim python3 python3-pip openssh-server sudo ostree locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD https://ci.deepin.io/view/dstore/job/lastore-daemon/lastSuccessfulBuild/artifact/lastore-tools /usr/bin/lastore-tools

RUN mkdir -p /var/run/sshd \
    && useradd -m -G sudo deepin \
    && echo 'deepin:0' | chpasswd \
    && echo "deepin	ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && chmod a+x /usr/bin/lastore-tools \
    && mkdir -pv /lastore \
    && chmod 777 /lastore \
    && sed -i "s/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g" /etc/locale.gen \
    && locale-gen

ENV LC_ALL=zh_CN.UTF-8

COPY entrypoint.sh /entrypoint.sh
USER deepin
WORKDIR /data 
CMD ["bash", "/entrypoint.sh"]
