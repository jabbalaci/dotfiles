#!/usr/bin/env python3
# encoding: utf-8

import os
from signal import SIGTERM

PID_FILE = '/tmp/nvim_keep_server_alive.pid'


def main():
    try:
        with open(PID_FILE) as f:
            pid = int(f.read())
    except FileNotFoundError:
        print("# the pid file {} is missing".format(PID_FILE))
        return

    os.kill(pid, SIGTERM)

##############################################################################

if __name__ == "__main__":
    main()
