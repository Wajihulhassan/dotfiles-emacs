#!/bin/bash

files=".emacs .emacs.d .bashrc .bash_aliases"        # list of files/folders to symlink in homedir

for file in $files; do
    echo "Creating symlink to ${file} in home directory."
    ln -s $file ~/$file
done

source ~/.bashrc