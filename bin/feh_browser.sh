#!/usr/bin/env bash

# https://wiki.archlinux.org/index.php/Feh
#
# Invoke the script with the selected image's path, followed by any
# additional arguments to feh. Here is an example of a launcher that you
# can use in a file browser:
#
# $ /path/to/script/feh_browser.sh %f -F -Z
#
# -F and -Z are feh arguments. -F opens the image in fullscreen mode, and
# -Z automatically zooms the image. Adding the -q flag (quiet) suppresses
# error messages to the terminal when feh tries loading non-image files
# from the current folder.

shopt -s nullglob

if [[ ! -f $1 ]]; then
    echo "$0: first argument is not a file" >&2
    exit 1
fi

file=$(basename -- "$1")
dir=$(dirname -- "$1")
arr=()
shift

cd -- "$dir"

for i in *; do
    [[ -f $i ]] || continue
    arr+=("$i")
    [[ $i == $file ]] && c=$((${#arr[@]} - 1))
done

exec feh "$@" -- "${arr[@]:c}" "${arr[@]:0:c}"
