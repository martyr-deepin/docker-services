FROM hub.deepin.io/deepin/deepin-web-runner
MAINTAINER choldrim@foxmail.com

RUN apt-get update \
    && yes | apt-get install --no-install-recommends --no-install-suggests \
       sudo curl wget net-tools vim openssh-server \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ssh user
RUN useradd -m -s /bin/bash deepin && \
    echo deepin:deepin | chpasswd && \
    echo "deepin ALL=(root) NOPASSWD: ALL" > /etc/sudoers.d/webdeployer && \
    chmod 440 /etc/sudoers.d/webdeployer && \
    mkdir -p /var/run/sshd

RUN php -r "readfile('https://getcomposer.org/installer');" | php && \
    mv composer.phar /usr/bin/composer && \
    composer config -g github-oauth.github.com 385202d1e2f37fa7517b3b498c555da20cb25dfe

CMD ["/usr/sbin/sshd", "-D"]
