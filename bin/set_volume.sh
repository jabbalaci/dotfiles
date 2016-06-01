#!/usr/bin/env bash

#
# from http://askubuntu.com/questions/44680
# listing current volume:
#
#     pacmd list-sinks | grep volume
#

if [ "$HOSTNAME" == "vostro" ]; then
    cmd="pacmd set-sink-volume 0 100000"
    echo "#" $cmd
    $cmd
fi
