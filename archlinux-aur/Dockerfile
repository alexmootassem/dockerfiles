FROM amootassem/archlinux
MAINTAINER Alexandre MOOTASSEM <alexandre.mootassem@gmail.com>

RUN pacman -S --noconfirm --needed base-devel
RUN sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers
RUN useradd -m -G wheel docker

WORKDIR /home/docker

RUN su -c "(bash <(curl aur.sh) -si --noconfirm package-query yaourt)" -s /bin/bash docker && rm -rf /home/docker/*
