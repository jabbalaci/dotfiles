#!/usr/bin/env bash

sleep 5

~/bin/nvim_keep_server_alive.py &
sleep 2
konsole &
