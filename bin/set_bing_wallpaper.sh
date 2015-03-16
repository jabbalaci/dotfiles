#!/usr/bin/env bash

sleep 20

export PYTHONPATH=$HOME/Dropbox/python/lib/jabbapylib2
LOG=/trash/bing/log.txt

if [ "$DESKTOP_SESSION" == "ubuntu" ]; then
    PID=$(pgrep gnome-session)
    export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)
fi

$HOME/Dropbox/python/lib/jabbapylib2/apps/bing.py >> $LOG 2>&1

# in crontab, put the following lines:
#
# DISPLAY=:0
# DESKTOP_SESSION=xfce    # Manjaro (Xfce)
# DESKTOP_SESSION=ubuntu  # Ubuntu (Unity)
#
# 0 21 * * * $HOME/bin/set_bing_wallpaper.sh
