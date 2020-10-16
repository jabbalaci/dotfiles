#!/usr/bin/env bash

# based on https://gist.github.com/denis111/c3e08bd7c60febc1de8219930a97c2f6

DIR=~/.config/JetBrains/Rider2020.2

echo "removing evaluation key"
rm  -rf $DIR/eval

# Customize it if needed. Now it's specific for Rider.
rm -rf ~/.java/.userPrefs/jetbrains/rider

echo "resetting evalsprt in other.xml"
sed -i '/evlsprt/d' $DIR/options/other.xml

echo "resetting evalsprt in prefs.xml"
sed -i '/evlsprt/d' ~/.java/.userPrefs/prefs.xml

echo "change dates"
find $DIR -type d -exec touch -t $(date +"%Y%m%d%H%M") {} +;
find $DIR -type f -exec touch -t $(date +"%Y%m%d%H%M") {} +;
