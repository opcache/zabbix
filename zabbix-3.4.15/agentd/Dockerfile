FROM alpine:3.8
LABEL maintainer="ppabc (ppabc@qq.com)"
### Set Defaults
    ARG S6_OVERLAY_VERSION=v1.21.8.0
    ENV DEBUG_MODE=FALSE \
        ENABLE_CRON=FALSE \
        ENABLE_SMTP=FALSE \
        ENABLE_ZABBIX=TRUE
### Add Zabbix User First
        RUN set -x ; \
        addgroup -g 10050 zabbix ; \
        adduser -S -D -H -h /dev/null -s /sbin/nologin -G zabbix -u 10050 zabbix ;\
        apk update ; \
       apk --no-cache upgrade ; \
       apk --no-cache add \
             git \
             musl-dev \
            bash \
            curl \
            grep \
            less \
            logrotate \
            msmtp \
            nano \
            sudo \
            tzdata \
            vim \
            zabbix-agent \
            zabbix-utils \
            ; \
       rm -rf /var/cache/apk/* ; \
       rm -rf /etc/logrotate.d/acpid ; \
       cp -R /usr/share/zoneinfo/Asia/Shanghai /etc/localtime ; \
       echo 'Asia/Shanghai' > /etc/timezone ; \
       echo '%zabbix ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers ; \
### S6 Installation
       curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar xfz - -C / ; \
### Add Folders
       mkdir -p /assets/cron

   ADD zabbix-3.4.15/agentd/root /

### Networking Configuration
   EXPOSE 1025 8025 10050/TCP 

### Entrypoint Configuration
   ENTRYPOINT ["/init"]
