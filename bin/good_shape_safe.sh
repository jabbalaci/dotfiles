#!/usr/bin/env bash

# good_shape_safe.sh

# APT="apt-get"    # below Ubuntu 16.04
APT="apt"          # for Ubuntu 16.04+

sudo dpkg --configure -a\
&& sudo $APT -f install\
&& sudo $APT --fix-missing install\
&& sudo $APT update\
&& sudo $APT upgrade\
&& sudo $APT dist-upgrade\
&& sudo $APT autoremove
