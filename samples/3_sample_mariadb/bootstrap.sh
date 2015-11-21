#!/bin/sh

echo "*** installing mariadb ***"

yum update -y
yum install mariadb mariadb-server -y

echo "*** installed mariadb ***"

echo "*** starting mariadb ***"

systemctl start mariadb.service
systemctl enable mariadb.service

echo "*** started mariadb ***"