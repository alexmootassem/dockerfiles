FROM amootassem/mysql
MAINTAINER Alexandre MOOTASSEM <alexandre.mootassem@gmail.com>

RUN apt-get clean && apt-get update -y && apt-get install -y --fix-missing php5-fpm php5-curl php5-geoip php5-mysqlnd php5-cli php5-intl php5-gd && \
    \
    rm -rf /var/lib/apt/lists/* && \
    \
    sed -e 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf && \
    sed -e 's/;listen\.owner/listen.owner/' -i /etc/php5/fpm/pool.d/www.conf && \
    sed -e 's/;listen\.group/listen.group/' -i /etc/php5/fpm/pool.d/www.conf && \
    sed -e 's/max_execution_time = 30/max_execution_time = 300/g' -i /etc/php5/cli/php.ini && \
    sed -e 's/max_execution_time = 30/max_execution_time = 300/g' -i /etc/php5/fpm/php.ini && \
    sed -e 's/memory_limit = 128M/memory_limit = 512M/g' -i /etc/php5/fpm/php.ini && \
    sed -e 's/post_max_size = 8M/post_max_size = 25M/g' -i /etc/php5/cli/php.ini && \
    sed -e 's/post_max_size = 8M/post_max_size = 25M/g' -i /etc/php5/fpm/php.ini && \
    sed -e 's/;date.timezone =/date.timezone = "Europe\/Paris"/g' -i /etc/php5/cli/php.ini && \
    sed -e 's/;date.timezone =/date.timezone = "Europe\/Paris"/g' -i /etc/php5/fpm/php.ini && \
    \
    wget https://phar.phpunit.de/phpunit.phar -O /usr/local/bin/phpunit && chmod +x /usr/local/bin/phpunit && phpunit --version

COPY provision/supervisor.conf /etc/supervisor/conf.d/supervisor.conf
COPY provision/rsyslog.conf /etc/rsyslog.conf

WORKDIR /srv
COPY . /srv
    
CMD ["/entrypoint.sh"]
