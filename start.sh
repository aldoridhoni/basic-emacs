#!/bin/sh
# https://stackoverflow.com/questions/29832037/how-to-get-script-directory-in-posix-sh

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
emacs_bin=$(which emacs)
exec env HOME="$dir" REAL_HOME="$HOME" $emacs_bin --name Basic --title Basic --maximized "$@"
