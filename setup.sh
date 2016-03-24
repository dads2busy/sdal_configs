#! /usr/bin/env bash

if [ ! -f ~/.bash_profile ]; then
    echo "~/.bash_profile not found"
    cp ~/sdal_configs/.bash_profile ~/
    echo "~/.bash_profile created"
fi

if [ ! -f ~/.bashrc ]; then
    echo "~/.bashrc not found"
    cp ~/sdal_configs/.bashrc ~/
    echo "~/.bashrc created"
fi


echo "\"Added by sdal_configs setup\"" >> ~/.bashrc

echo "source ~/sdal_configs/.bash_aliases_sdal" >> ~/.bashrc

source ~/sdal_configs/make_ssh_config.sh
