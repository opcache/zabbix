
# Thea项目基于Alpine系统下搭建zabbix
- 名字来源于希腊神话中的人物,西亚(Thea)：十二泰坦之一，海泼里恩之妻。

## 项目简介
- Alpine系统下搭建zabbix server 欢迎访问 https://aq2.cn；
- 实现快速安装zabbix server
- 简单 高效 快捷！

## 安装使用Zabbix 4.4.7

```
docker run -it -d --name mysql --net=host -v /data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=test123123  opcache/zabbix:4.4.7-mariadb

docker run --name zabbix-server-mysql -t -e DB_SERVER_HOST="127.0.0.1" -e MYSQL_DATABASE="zabbix" -e MYSQL_USER="zabbix" -e MYSQL_PASSWORD="zabbix" -e MYSQL_ROOT_PASSWORD="zabbix" -v /etc/localtime:/etc/localtime:ro --net=host -d opcache/zabbix:4.4.7-server

docker run --name zabbix-web-nginx-mysql2 -t -e DB_SERVER_HOST="127.0.0.1" -e MYSQL_DATABASE="zabbix" -e MYSQL_USER="zabbix" -e MYSQL_PASSWORD="zabbix" -e MYSQL_ROOT_PASSWORD="zabbix" -e ZBX_SERVER_HOST="127.0.0.1" -e PHP_TZ="Asia/Shanghai" -e ZBX_TYPE="frontend" -e ZBX_OPT_TYPE="nginx" --net=host -d opcache/zabbix:4.4.7-web

docker run --name some-zabbix-agent  -e ZBX_SERVER_HOST="127.0.0.1"  -e ZBX_SERVER_HOST="127.0.0.1"  -e ZBX_SERVER_PORT=10051  -e ZBX_METADATA="Linux"  -e PHP_TZ="Asia/Shanghai"  --privileged --net=host -d opcache/zabbix:4.4.7-agent

docker run --name some-zabbix-agent2  -e ZBX_SERVER_HOST="127.0.0.1"  -e ZBX_SERVER_HOST="127.0.0.1"  -e ZBX_SERVER_PORT=10051  -e ZBX_METADATA="Linux"  -e PHP_TZ="Asia/Shanghai"  --privileged --net=host -d opcache/zabbix:4.4.7-agent2

```
