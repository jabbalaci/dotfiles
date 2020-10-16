#!/usr/bin/env bash

# run it with Cygwin

DIR=/cygdrive/c/Users/jabba/AppData/Roaming/JetBrains/Rider2020.2

# cd $DIR
# ls -al

echo "removing evaluation key"
rm  -rf $DIR/eval

echo "resetting evalsprt in other.xml"
cd $DIR/options
sed -i '/evlsprt/d' other.xml

# echo "change dates"
# TODAY=`date +"%Y%m%d%H%M"`
# find $DIR -type d -exec touch -t $TODAY {} +;
# find $DIR -type f -exec touch -t $TODAY {} +;
