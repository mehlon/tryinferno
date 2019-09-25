#!/dis/sh
os sh -c 'Xvfb :0 -screen 0 ${DISPLAY_WIDTH}x${DISPLAY_HEIGHT}x24 -listen tcp -ac' &
sleep 1
os x11vnc -forever -shared -nopw -ncache 10 -cursor arrow  &
os sh -c 'websockify --web /usr/share/novnc $PORT localhost:5900' &

echo wait 3....
sleep 3
wm/wm # wm/logon -u inferno


