#!/usr/bin/env python2

import os
import shutil
from datetime import datetime

BASE = os.path.dirname(os.path.abspath(__file__))

SRC_DIR = "{home}/Dropbox/python/webapps/jabba_kb_project".format(home=os.path.expanduser('~'))


def get_timestamp_from_year_to_second():
    """A compact timestamp."""
    now = datetime.now()
    date = datetime.date(now)
    time = datetime.time(now)
    template = "{year}_{month:02}_{day:02}_{hour:02}{minute:02}{second:02}"
    return template.format(year=date.year, month=date.month, day=date.day,
                           hour=time.hour, minute=time.minute, second=time.second)


def main():
    dest = "{base}/jabba_kb_project_{timestamp}".format(
        base=BASE,
        timestamp=get_timestamp_from_year_to_second()
    )
    shutil.copytree(SRC_DIR, dest)

#############################################################################

if __name__ == "__main__":
    main()
