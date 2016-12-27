FROM hub.deepin.io/debian:stretch

ENV NGINX_VERSION=1.10.2-2

MAINTAINER deepin choldrim <choldrim@foxmail.com>

RUN apt-get update \
    && yes | apt-get install --no-install-recommends --no-install-suggests \
       nginx-extras=${NGINX_VERSION} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 443/tcp 80/tcp

CMD ["nginx" "-g" "daemon off;"]
