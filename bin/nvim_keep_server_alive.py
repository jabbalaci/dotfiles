#!/usr/bin/env python3
# encoding: utf-8

"""
Keep the nvim server alive.

If the nvim server gets closed, restart it.
"""

import atexit
import os
import re
import shlex
import stat
import sys
from collections import OrderedDict
from subprocess import PIPE, STDOUT, Popen
from time import sleep

NVIM_SERVER_WINDOW_TITLE = r'NVIM server.*Konsole'
NVIM_LISTEN_ADDRESS = '/tmp/nvim_server.sock'
START_SCRIPT = '{home}/bin/nvim_start_server.sh'.format(home=os.path.expanduser("~"))
PID_FILE = '/tmp/nvim_keep_server_alive.pid'

required_commands = [
    '/usr/bin/wmctrl',
    '/usr/bin/xdotool',
]


############
## helper ##
############

def is_socket(path):
    """
    Decide if a file is a socket or not.
    """
    try:
        mode = os.stat(path).st_mode
        return stat.S_ISSOCK(mode)
    except FileNotFoundError:
        return False


def check_required_commands():
    """
    Verify if the external binaries are available.
    """
    for cmd in required_commands:
        if not os.path.isfile(cmd):
            print("Error: the command '{0}' is not available! Abort.".format(cmd))
            sys.exit(1)


def cleanup():
    try:
        os.unlink(PID_FILE)
    except FileNotFoundError:
        pass


###################################
## window and process management ##
###################################

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
        d = OrderedDict()
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


###############
## main part ##
###############

def main():
    with open(PID_FILE, 'w') as f:
        print(os.getpid(), file=f)

    try:
        while True:
            if is_socket(NVIM_LISTEN_ADDRESS):    # and get_wid_by_title(NVIM_SERVER_WINDOW_TITLE):
                sleep(1)
            else:
                cmd = "{script} 2>/dev/null &".format(script=START_SCRIPT)    # start in the bg
                os.system(cmd)
                sleep(5)
    except KeyboardInterrupt:
        print()

##############################################################################

if __name__ == "__main__":
    check_required_commands()
    #
    atexit.register(cleanup)
    main()
