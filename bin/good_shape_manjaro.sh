#!/usr/bin/env bash

# no questions: --noconfirm

#sudo pacman-mirrors -f 0
#sudo pacman -Syy

# run these two commands ^^^ together

#sudo pacman -Syu
#sudo pacman -R $(pacman -Qdtq)

if [ "$1" == "-nc" ]
then
    set -- "--noconfirm"
fi

yaourt -Syua "$@"
sudo pacman -Scc
