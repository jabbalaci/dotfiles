#!/usr/bin/env python2
# encoding: utf-8

"""
restore reddit json
"""

from __future__ import (absolute_import, division,
                        print_function, unicode_literals)

import os
import shutil
from glob import glob

from unipath import Path


class ChDir(object):
    """
    Step into a directory temporarily.
    Not very elegant, it should be removed in the future.
    """
    def __init__(self, path):
        self.old_dir = os.getcwd()
        self.new_dir = path

    def __enter__(self):
        os.chdir(self.new_dir)

    def __exit__(self, *args):
        os.chdir(self.old_dir)


def find_json(dname):
    p = Path(dname, "firefox")
    with ChDir(p):
        profile = glob("*.default")[0]
        p = Path(p, profile)
    p = Path(p, "jetpack", "jid1-xUfzOsOFlzSOXg@jetpack")
    p = Path(p, "simple-storage", "store.json")
    assert p.isfile()
    return p


def main():
    in_home = "{home}/.mozilla".format(home=os.path.expanduser("~"))
    in_home_json = find_json(in_home)
    print(in_home_json, os.path.getsize(in_home_json))

    for dname in sorted(glob(".mozilla_*"), reverse=True):
        in_dir_json = find_json(dname)
        print(in_dir_json, os.path.getsize(in_dir_json))

    print()
    inp = raw_input("Which one to restore: ")
    if not Path(inp).isfile():
        print("Error: that's not a file.")
        exit(1)
    # else
    shutil.copy(inp, in_home_json)
    print("{0} was overwritten with {1}".format(in_home_json, inp))

##############################################################################

if __name__ == "__main__":
    main()
