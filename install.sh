#!/usr/bin/env bash

set -e
set -u

DOTCONFIG="$(dirname $0)/dotconfig"
CONFIG_FOLDER="$HOME/.config"

# $1 is the folder containing the config files to link
# $2 is the destination folder in which the folder structure must be reproduced
link_files()
{
    find $1 | while read path
do
    dest_path="$CONFIG_FOLDER$(echo "$path" | sed 's:.*/dotconfig::g')"

    if [ -d "$path" ]
    then
        mkdir -p "$dest_path"

    elif [ -f "$path" ]
    then
        ln -sb "$(realpath "$path")" "$dest_path"
    else 
        echo "$path is not valid";
        exit 1
    fi
done
}

nvim_install_packer()
{
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

link_files $DOTCONFIG $CONFIG_FOLDER
nvim_install_packer
