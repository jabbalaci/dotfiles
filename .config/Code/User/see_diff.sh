#!/usr/bin/env bash

TMP=/tmp/current_34956.tmp
./list_extensions.sh > $TMP
meld extensions.txt $TMP
\rm $TMP
