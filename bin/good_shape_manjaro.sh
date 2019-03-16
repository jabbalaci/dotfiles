#!/usr/bin/env bash

# no questions: --noconfirm

# sudo pacman-mirrors -f 0 && sudo pacman -Syy
# sudo pacman-mirrors --fasttrack && sudo pacman -Syyu    # if download is slow

# these ^^^ must be used together

#sudo pacman -Syu
#sudo pacman -R $(pacman -Qdtq)

if [ "$1" == "-nc" ]
then
    set -- "--noconfirm"
fi

# yaourt -Syua "$@"
yay

# sudo pacman -Syyuu "$@"

sudo pacman -Scc
