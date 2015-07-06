FROM base/archlinux
MAINTAINER Alexandre MOOTASSEM <alexandre.mootassem@gmail.com>

# Fix for "signature from "Anatol Pomozov <anatol.pomozov@gmail.com>" is unknown trust"
RUN pacman-key --populate archlinux \
    && pacman-key --refresh-keys

# Optimize mirror list
RUN pacman -Syy \
    && pacman --noconfirm -S reflector \
    && cp -vf /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup \
    && reflector -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist \
    && pacman --noconfirm -Rsn reflector python

# Update system
RUN pacman --noconfirm -Su \
    && pacman-db-upgrade \
    && pacman --noconfirm -Scc \
    && pacman-optimize \
    && pacman --noconfirm -Syu
ONBUILD RUN pacman --noconfirm -Syu
