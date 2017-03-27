#!/usr/bin/env bash

cd /trash/backup
HERE=`pwd`

cd firefox
./backup_firefox.py
./keep_last_four.py
cd $HERE

cd webapps/movieorg_project
./backup_movieorg.py
./keep_last_four.py
cd $HERE

cd webapps/jabba_kb_project
./backup_jabba_kb.py
./keep_last_four.py
cd $HERE

cd webapps/reddit_images_and_comments
./backup.py
./keep_last_four.py
cd $HERE
