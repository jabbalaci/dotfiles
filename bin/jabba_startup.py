#!/usr/bin/env python3
# encoding: utf-8


import os
import re
import shlex
import stat
import sys
from subprocess import PIPE, STDOUT, Popen
from time import sleep

NVIM_LISTEN_ADDRESS = '/tmp/nvim_server.sock'

required_commands = [
    '/usr/bin/wmctrl',
]


def check_required_commands():
    """
    Verify if the external binaries are available.
    """
    for cmd in required_commands:
        if not os.path.isfile(cmd):
            print("Error: the command '{0}' is not available! Abort.".format(cmd))
            sys.exit(1)


def is_socket(path):
    """
    Decide if a file is a socket or not.
    """
    try:
        mode = os.stat(path).st_mode
        return stat.S_ISSOCK(mode)
    except FileNotFoundError:
        return False


def get_simple_cmd_output(cmd, stderr=STDOUT):
    """
    Execute a simple external command and get its output.

    The command contains no pipes. Error messages are
    redirected to the standard output by default.
    """
    args = shlex.split(cmd)
    return Popen(args, stdout=PIPE, stderr=stderr).communicate()[0].decode("utf8")


def get_wmctrl_output():
    """
    Parses the output of wmctrl and returns a list of ordered dicts.
    """
    cmd = "wmctrl -lGpx"
    lines = [line for line in get_simple_cmd_output(cmd)
             .encode('ascii', 'ignore')
             .decode('ascii').split("\n") if line]

    res = []
    for line in lines:
        pieces = line.split()
        d = {}
        d['wid'] = pieces[0]
        d['desktop'] = int(pieces[1])
        d['pid'] = int(pieces[2])
        d['geometry'] = [int(x) for x in pieces[3:7]]
        d['window_class'] = pieces[7]
        d['client_machine_name'] = pieces[8]
        d['window_title'] = ' '.join(pieces[9:])
        res.append(d)
    #
    return res


def get_wid_by_title(title_regexp):
    """
    Having the window title (as a regexp), return its wid.

    If not found, return None.
    """
    for d in get_wmctrl_output():
        m = re.search(title_regexp, d['window_title'])
        if m:
            return d['wid']
    #
    return None


def wait_for_file(fname):
    while True:
        if is_socket(fname):
            return
        # else
        sleep(1)


def wait_for_window(title):
    while True:
        if get_wid_by_title(title):
            return
        # else
        sleep(1)


def main():
    # Step 1
    # start nvim server
    # cmd = "~/bin/nvim_keep_server_alive.py &"
    # print("# starting the nvim server...")
    # os.system(cmd)
    # wait_for_file(NVIM_LISTEN_ADDRESS)
    # print("# nvim server is running")
    # print()

    # Step 2
    # backup mozilla
    cmd = "/trash/backup/firefox/make_backup.py"
    print("# backing up the mozilla folder")
    os.system(cmd)
    print("# backup is done")
    print()

    # Step 3
    # start Firefox
    cmd = "/usr/bin/firefox &>/dev/null &"
    print("# starting Firefox...")
    os.system(cmd)
    wait_for_window('Vimperator')
    print("# Firefox is running")
    print()

    # Step 4
    # start konsole
    cmd = "/usr/bin/konsole &>/dev/null &"
    os.system(cmd)
    print("# starting konsole")
    print()

    # Step 5
    # set the volume
    print("# setting the volume")
    os.system("~/bin/set_volume.sh")
    print()

##############################################################################

if __name__ == "__main__":
    check_required_commands()
    #
    main()
