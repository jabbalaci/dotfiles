#!/usr/bin/env python3
# encoding: utf-8

"""
If the nvim server is available (i.e. listening on
a specific socket), then let's connect to it.
The focus is also put on the server instance.

This way only one nvim instance is used.

See <https://github.com/mhinz/neovim-remote> for
more info about support for `--remote` and friends.
"""

import os
import re
import shlex
import stat
import sys
from collections import OrderedDict
from subprocess import PIPE, STDOUT, Popen

NVIM_SERVER_WINDOW_TITLE = r'NVIM server.*Konsole'
NVIM_LISTEN_ADDRESS = '/tmp/nvim_server.sock'

DEBUG = False

required_commands = [
    '/usr/bin/wmctrl',
    '/usr/bin/xdotool',
    '/usr/bin/nvim',
    '/usr/bin/nvr',
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


def activate_window_by_id(wid):
    """
    Put the focus on and activate the the window with the given ID.
    """
    os.system('xdotool windowactivate {wid}'.format(wid=wid))


def switch_to_window(title_regexp):
    """
    Put the focus on the window with the specified title.
    """
    wid = get_wid_by_title(title_regexp)
    if wid:
        if DEBUG:
            print('# window id:', wid)
        wid = int(wid, 16)
        if DEBUG:
            print('# switching to the other window')
        activate_window_by_id(wid)
    else:
        if DEBUG:
            print('# not found')


###############
## main part ##
###############

def nvim_server_running():
    """
    Is the nvim server running?

    The ideal solution is to run the server in a dedicated terminal.
    """
    if is_socket(NVIM_LISTEN_ADDRESS):
        return True
    # else
    print("# the nvim server is not running")
    print("# tip: ~/bin/start_nvim_server.sh")
    return False


def main():
    args = ' '.join(sys.argv[1:])
    editor = 'nvim'
    server_running = nvim_server_running()
    if server_running:
        editor = 'nvr --servername {addr}'.format(addr=NVIM_LISTEN_ADDRESS)
    #
    cmd = '{ed} {args}'.format(ed=editor, args=args)
    #
    if len(args) == 0:
        if server_running:
            switch_to_window(NVIM_SERVER_WINDOW_TITLE)
        else:
            if DEBUG:
                print("#", cmd)
            os.system(cmd)
    else:
        if DEBUG:
            print("#", cmd)
        os.system(cmd)
        if server_running:
            switch_to_window(NVIM_SERVER_WINDOW_TITLE)

##############################################################################

if __name__ == "__main__":
    check_required_commands()
    main()
