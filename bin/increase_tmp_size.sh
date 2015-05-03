#!/usr/bin/bash

# used for Manjaro
# https://ubuntuincident.wordpress.com/2015/03/10/manjaro-tmp-is-too-small-cannot-install-new-software/

sudo mount -o remount,size=2G,noatime /tmp
