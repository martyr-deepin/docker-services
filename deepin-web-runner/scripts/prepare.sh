#!/bin/bash

# Install packages

function install_packages(){
    apt-get update
    apt-get install -y supervisor
    apt-get install -y php5-fpm php5-mysqlnd php5-gd php-gettext php5-curl php5-mcrypt
    apt-get install -y nginx-full
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y mysql-server mysql-client
}

function install_nodejs(){
    cd /usr/local/bin
    ln -sv node nodejs
}

function deploy(){
    install_packages
    install_nodejs
}

deploy
