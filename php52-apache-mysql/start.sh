#!/bin/bash

INSTANCE_NAME=php52-apache-mysql


# create directory if not exists
[ -d ~/www ] || mkdir -p ~/www
[ -d ~/mysql/data ] || mkdir -p ~/mysql/data
[ -d ~/mysql/mysqld ] || mkdir -p ~/mysql/mysqld
[ -d ~/mysql/logs ] || mkdir -p ~/mysql/logs

docker rm -f $INSTANCE_NAME

# run docker
docker run -d \
    --name $INSTANCE_NAME \
    -p 80:80 \
    -v ~/www/:/var/www/ \
    -v ~/mysql/data/:/var/lib/mysql/ \
    -v ~/mysql/mysqld/:/opt/mysql/mysqld/ \
    -v ~/mysql/logs/:/opt/mysql/logging/ \
    ball6847/php52-apache-mysql
