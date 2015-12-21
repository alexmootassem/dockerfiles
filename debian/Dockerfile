FROM debian:jessie
MAINTAINER Alexandre MOOTASSEM <alexandre.mootassem@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8
ENV TIMEZONE Europe/Paris

RUN echo "nameserver 8.8.8.8" | tee /etc/resolv.conf > /dev/null && \
    \
    groupadd -r mysql && useradd -r -g mysql mysql && \
    \
    sed -e 's/main/main contrib/g' -i /etc/apt/sources.list && \
    sed -e 's/httpredir.debian.org/ftp.us.debian.org/g' -i /etc/apt/sources.list && \
    echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && \
    \
    apt-get clean && apt-get update -y && apt-get install -y --fix-missing locales xfonts-base xfonts-75dpi rsyslog cron libpcre3-dev libssl-dev apt-build libgeoip-dev geoip-database-contrib supervisor vim less htop curl wget git-core && \
    \
    dpkg-reconfigure locales && locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8 && \
    \
    echo $TIMEZONE > /etc/timezone && dpkg-reconfigure tzdata && \
    \
    rm -rf /var/lib/apt/lists/* && \
    \
    echo 'alias la="ll -a"' >> /root/.bashrc && \
    echo 'alias ll="ls -lsh"' >> /root/.bashrc && \
    echo 'alias ls="ls -F --color=auto --group-directories-first"' >> /root/.bashrc && \
    echo 'alias vi="vim"' >> /root/.bashrc && \
    \
    sed -e 's/\/var\/www:\/usr\/sbin\/nologin/\/var\/www:\/bin\/sh/' -i /etc/passwd && \
    echo 'shell /bin/bash' > ~/.screenrc

COPY provision/supervisor.conf /etc/supervisor/conf.d/supervisor.conf
COPY provision/entrypoint.sh /entrypoint.sh

WORKDIR /srv
COPY . /srv
    
CMD ["/entrypoint.sh"]
