#!/bin/sh
docker run -it -d --name mysql --net=host -v /data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=test123123  opcache/zabbix:4.4.7-mariadb

docker run --name zabbix-server-mysql -t \
      -e DB_SERVER_HOST="127.0.0.1" \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix" \
      -e MYSQL_ROOT_PASSWORD="zabbix" \
      -v /etc/localtime:/etc/localtime:ro \
      --net=host \
      -d opcache/zabbix:4.4.7-server


docker run --name zabbix-web-nginx-mysql -t \
      -e DB_SERVER_HOST="127.0.0.1" \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix" \
      -e MYSQL_ROOT_PASSWORD="zabbix" \
      -e ZBX_SERVER_HOST="127.0.0.1" \
      -e PHP_TZ="Asia/Shanghai" \
      -e ZBX_TYPE="frontend" \
      -e ZBX_OPT_TYPE="nginx" \
      --net=host \
      -d opcache/zabbix:4.4.7-web

echo ok