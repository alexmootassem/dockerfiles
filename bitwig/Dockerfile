# Bitwig Studio in a container
#
# docker run --rm \
#   --privileged \
#   -e DISPLAY=unix$DISPLAY \
#   -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
#   -v /dev/snd:/dev/snd \
#   --name bitwig \
#   amootassem/bitwig

FROM amootassem/archlinux-aur
MAINTAINER Alexandre MOOTASSEM <alexandre.mootassem@gmail.com>

RUN pacman -S --noconfirm --needed libxkbfile xorg-server xorg-xinit xorg-server-utils java-runtime libreoffice-fresh pulseaudio \
    && echo enable-shm=no >> /etc/pulse/client.conf

USER docker

RUN yaourt -Syyua --noconfirm --needed bitwig-studio-demo

VOLUME ["/home/docker"]

ENTRYPOINT ["bitwig-studio"]
