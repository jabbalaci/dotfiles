#!/usr/bin/env bash

if [[ ! -f $1 ]]; then
    echo "$0: first argument is not a file" >&2
    exit 1
fi

feh . --start-at "./$1" -Fd
