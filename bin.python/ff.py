#!/usr/bin/env python
# encoding: utf-8

from __future__ import (absolute_import, division,
                        print_function, unicode_literals)

import sys
from time import sleep

import psutil


def is_running(name):
    for p in psutil.get_process_list():
        if p.name() == name:
            return True
    #
    return False


def main():
    name = 'firefox'
    print("checked process:", name)
    while True:
        if is_running(name):
            sys.stdout.write('.'); sys.stdout.flush()
            sleep(1)
        else:
            print()
            print("{n} is NOT running".format(n=name))
            break

##############################################################################

if __name__ == "__main__":
    main()
