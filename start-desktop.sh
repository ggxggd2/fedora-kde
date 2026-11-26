
#!/bin/bash
set -e

export DISPLAY=:0
export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=KDE
export DESKTOP_SESSION=plasma

mkdir -p /run/dbus

if ! pgrep -x dbus-daemon >/dev/null; then
    dbus-daemon --system --fork
fi

exec dbus-run-session startplasma-x11
