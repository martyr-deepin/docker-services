FROM hub.deepin.io/deepin-web-runner

MAINTAINER deepin-choldrim <choldrim@foxmail.com>

RUN apt-get update \
  && yes | apt-get install php5-ldap \
  && yes | apt-get install doxygen

RUN yes | apt-get install cron

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

COPY scripts/run.sh /usr/bin/

CMD ["/usr/bin/run.sh"]
