FROM hub.deepin.io/deepin/debian:jessie

# Use 163 as the apt repository 
ADD http://mirrors.163.com/.help/sources.list.jessie /etc/apt/sources.list

# add depenence
ADD dependence/node-v4.2.0-x64.tar.gz /usr/local

# Install dependence
ADD scripts/prepare.sh /data/scripts/prepare.sh
RUN bash /data/scripts/prepare.sh

WORKDIR /
