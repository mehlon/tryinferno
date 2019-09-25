FROM mehlon/purgatorio

RUN apt-get update
RUN apt-get install -y xvfb x11vnc novnc

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=600 \
    PORT=8080

ENV EMU="-c1 -g${DISPLAY_WIDTH}x${DISPLAY_HEIGHT}"
COPY . $INFERNO/usr/app

# docker run -p8080:8080 -it ivnc
CMD ["emu", "/usr/app/init.sh"]

