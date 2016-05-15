#!/usr/bin/env bash

export NVIM_LISTEN_ADDRESS=/tmp/nvim_server.sock
konsole --workdir ~ -p tabtitle='NVIM server' -e nvim
