#!/usr/bin/bash

pylint $1
pep8 --ignore=E221,E701,E202,E302 --repeat $1
pyflakes $1
true
