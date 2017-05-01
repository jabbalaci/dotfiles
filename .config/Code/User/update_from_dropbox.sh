#!/usr/bin/env bash

FROM="z:/home/jabba/.config/Code/User"

if [ "$OSTYPE" = "cygwin" ]; then
    cp -r $FROM/* .
else
    echo "Error: run this script under Windows (Cygwin)."
fi
