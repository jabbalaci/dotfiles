#!/usr/bin/env bash

cat $0
echo "----------"

sudo -H pip2 install pip -U
sudo -H pip3 install pip -U

sudo -H pip2 install neovim -U
sudo -H pip3 install neovim -U
