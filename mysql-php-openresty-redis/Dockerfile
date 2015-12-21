FROM amootassem/mysql-php-openresty
MAINTAINER Alexandre MOOTASSEM <alexandre.mootassem@gmail.com>

RUN apt-get clean && apt-get update -y && apt-get -t jessie-backports install -y --fix-missing redis-server && \
    \
    rm -rf /var/lib/apt/lists/* && \
    \
    sed -e 's/^\(daemonize\s*\)yes\s*$/\1no/g' -i /etc/redis/redis.conf && \
    sed -e 's/^\(appendonly\s*\)no\s*$/\1yes/g' -i /etc/redis/redis.conf

COPY provision/supervisor.conf /etc/supervisor/conf.d/supervisor.conf
COPY provision/rsyslog.conf /etc/rsyslog.conf

EXPOSE 3306 6379 80
VOLUME ["/var/lib/mysql", "/var/lib/redis"]

WORKDIR /srv
COPY . /srv

CMD ["/entrypoint.sh"]
