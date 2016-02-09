#! /usr/bin/bash

if [ ! -f ~/.bash_profile ]; then
    echo "~/.bash_profile not found"
    cp ~/git/sdal_configs/.bash_profile ~/
fi

if [ ! -f ~/.bashrc ]; then
    echo "~/.bashrc not found"
    cp ~/git/sdal_configs/.bashrc ~/
fi


echo "Added by sdal_configs setup" >> ~/.bashrc

echo "source ~/git/sdal_configs/.bash_aliases_sdal" >> ~/.bashrc
