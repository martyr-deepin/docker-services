#!/bin/bash -e

_term() {
    echo "Caught SIGTERM signal!"
    kill -TERM "$child" 2>/dev/null
}

trap _term SIGTERM

# ready ssh
sudo service ssh start

if [ -d "/data/repository-review" ]; then
    cd /data/repository-review
    git pull -r --force origin master
    cd -
else
    git clone https://cr.deepin.io/it/repository-review /data/repository-review
fi

# install dependences
sudo pip3 install setuptools
sudo pip3 install -r /data/repository-review/server/requirements.txt

cd /data/repository-review/server
python3 server.py &

child=$!
wait "$child"
