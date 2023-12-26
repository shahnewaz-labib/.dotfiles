#!/bin/bash

CONFIG_DIR=~/.config/nvim
CONFIG_OWN=~/.config/nvim-own
CONFIG_KICK=~/.config/nvim-kickstart

CUR=`readlink -f $CONFIG_DIR | awk -F/ '{print $NF}'`
KICK=`echo $CONFIG_KICK | awk -F/ '{print $NF}'`
OWN=`echo $CONFIG_OWN | awk -F/ '{print $NF}'`

if [ $CUR == $OWN ]; then
    rm -rf $CONFIG_DIR
    ln -sf $CONFIG_KICK $CONFIG_DIR
    notify-send "Swap success" "Swapped to kickstart config"
elif [ $CUR == $KICK ]; then
    rm -rf $CONFIG_DIR
    ln -sf $CONFIG_OWN $CONFIG_DIR
    notify-send "Swap success" "Swapped to own config"
else
    notify-send "Error Swapping" "Current config is not kickstart or own config"
fi

