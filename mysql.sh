#!/usr/bin/env bash

debconf-set-selections <<< 'mysql-server mysql-server/root_password password StackStorm'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password StackStorm'
apt-get update
apt-get install -y mysql-server
service mysql restart
