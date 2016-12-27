FROM hub.deepin.io/debian:jessie
MAINTAINER deepin

ADD http://mirrors.163.com/.help/sources.list.jessie /etc/apt/sources.list
RUN apt-get update \
    && yes | apt-get install \
       sudo vim make gcc git g++ openssh-client php5 php5-mcrypt php5-mysql \
       php-gettext php5-curl php5-gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ssh user
RUN useradd -m -s /bin/bash deepin && \
    echo deepin:deepin | chpasswd && \
    echo "deepin ALL=(root) NOPASSWD: ALL" > /etc/sudoers.d/webdeployer && \
    chmod 440 /etc/sudoers.d/webdeployer && \
    mkdir -p /var/run/sshd

RUN php -r "readfile('https://getcomposer.org/installer');" | php \
    && mv composer.phar /usr/bin/composer \
    && composer config -g github-oauth.github.com 385202d1e2f37fa7517b3b498c555da20cb25dfe \
    && ln -sv node nodejs

ADD go1.5.1.tar.gz /usr/local
ADD node-v4.2.0-x64.tar.gz /usr/local
ADD npmrc /root/.npmrc

ENV PATH=$PATH:/usr/local/go/bin

CMD ["/usr/sbin/sshd", "-D"]
