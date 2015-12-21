FROM amootassem/mysql-php
MAINTAINER Alexandre MOOTASSEM <alexandre.mootassem@gmail.com>

ENV OPENRESTY_VERSION 1.7.10.1

RUN usermod -o --uid 1000 www-data && groupmod -o --gid 1000 www-data && \
    \
    curl http://openresty.org/download/ngx_openresty-$OPENRESTY_VERSION.tar.gz > /usr/src/ngx_openresty-$OPENRESTY_VERSION.tar.gz && \
    cd /usr/src && tar xzf ngx_openresty-$OPENRESTY_VERSION.tar.gz && \
    readonly NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1); echo "using upto $NPROC threads"; \
    cd /usr/src/ngx_openresty-$OPENRESTY_VERSION && ./configure \
    --with-http_geoip_module \
    --with-http_addition_module \
    --with-http_dav_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_stub_status_module \
    --with-http_ssl_module \
    --with-http_sub_module \
    --with-ipv6 \
    --with-pcre-jit \
    --with-luajit \
    --without-http_ssi_module \
    --without-http_userid_module \
    --without-http_uwsgi_module \
    --without-http_scgi_module \
    --without-http_memcached_module \
    -j${NPROC} && \
    make -j${NPROC} && make install && \
    rm -rf /ngx_openresty* && \
    mkdir /var/log/nginx && \
    mkdir /usr/local/openresty/nginx/conf/sites-available/ && \
    mkdir /usr/local/openresty/nginx/conf/sites-enabled/

COPY provision/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY provision/supervisor.conf /etc/supervisor/conf.d/supervisor.conf
COPY provision/rsyslog.conf /etc/rsyslog.conf
COPY provision/init.sh /init.sh
COPY provision/entrypoint.sh /entrypoint.sh
RUN ln -sf /usr/local/openresty/nginx/conf/sites-available/default /usr/local/openresty/nginx/conf/sites-enabled/default

EXPOSE 3306 80
VOLUME ["/var/lib/mysql"]

WORKDIR /srv
COPY . /srv
RUN chown -R www-data:www-data /srv
    
CMD ["/entrypoint.sh"]
