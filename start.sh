#!/bin/sh
# https://stackoverflow.com/questions/29832037/how-to-get-script-directory-in-posix-sh


script=$(readlink -- "$0")
script_dir=$(dirname -- "$script")
dir=$(CDPATH= cd -- "$script_dir" && pwd -P)
emacs_bin=$(which emacs)

ln -s $HOME/.config $script_dir/.config
ln -s $HOME/.local $script_dir/.local

exec env HOME="$dir" REAL_HOME="$HOME" $emacs_bin --maximized "$@"
