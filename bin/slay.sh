#!/usr/bin/env bash

killall rhythmbox 2>/dev/null
rhythmbox http://relay3.slayradio.org:8000 &
