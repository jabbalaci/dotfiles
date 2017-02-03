#!/usr/bin/env bash

# no questions: --noconfirm

#sudo pacman-mirrors -g
#sudo pacman -Syy
#sudo pacman -Syu
#sudo pacman -R $(pacman -Qdtq)

yaourt -Syua "$@"
sudo pacman -Scc
