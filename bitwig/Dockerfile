FROM amootassem/archlinux-aur
MAINTAINER Alexandre MOOTASSEM <alexandre.mootassem@gmail.com>

RUN pacman -S --noconfirm --needed libxkbfile xorg-server xorg-xinit xorg-server-utils libreoffice-fresh pulseaudio \
    && echo enable-shm=no >> /etc/pulse/client.conf

USER docker

RUN yaourt -Syyua --noconfirm --needed bitwig-studio-demo

ENTRYPOINT ["bitwig-studio"]
