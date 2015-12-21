FROM amootassem/debian
MAINTAINER Alexandre MOOTASSEM <alexandre.mootassem@gmail.com>

RUN apt-get clean && apt-get update -y && apt-get install -y --fix-missing mysql-server && \
    \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql && \
    \
    /usr/bin/mysql_install_db

COPY provision/my.cnf /etc/mysql/conf.d/my.cnf
COPY provision/supervisor.conf /etc/supervisor/conf.d/supervisor.conf
COPY provision/rsyslog.conf /etc/rsyslog.conf
COPY provision/init.sh /init.sh

EXPOSE 3306
VOLUME ["/var/lib/mysql"]

WORKDIR /srv
COPY . /srv
    
CMD ["/entrypoint.sh"]
