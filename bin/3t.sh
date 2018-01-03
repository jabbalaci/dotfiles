#!/usr/bin/env bash

# rename this file to 3t
# and put it in $HOME/bin

# also, in /opt create a symbolic link called studio-3t 
# that points to the Studio-3T installation directory

cd /opt/studio-3t/bin
./studio-3t.sh &>/dev/null &
