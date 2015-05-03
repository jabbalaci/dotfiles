#!/usr/bin/env python3
# encoding: utf-8

"""
Python 3 project
"""

import sys


def process(old, new):
    with open(old) as f:
        content = set(f.readlines())

    with open(new) as g:
        for line in g:
            if line not in content:
                print(line, end='')

##############################################################################

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: {} old_list.txt new_list.txt".format(sys.argv[0]))
        sys.exit(1)
    # else
    old, new = sys.argv[1:]
    process(old, new)
