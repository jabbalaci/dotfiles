#!/usr/bin/env bash

# no questions: --noconfirm

#sudo pacman-mirrors -g
#sudo pacman -Syy
#sudo pacman -Syu
#sudo pacman -R $(pacman -Qdtq)

if [ "$1" == "-nc" ]
then
    set -- "--noconfirm"
fi

yaourt -Syua "$@"
sudo pacman -Scc
