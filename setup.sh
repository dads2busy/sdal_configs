#! /usr/bin/bash

if [ ! -f ~/.bash_profile ]; then
    echo "~/.bash_profile not found"
    cp ~/git/sdal_configs/.bash_profile ~/
    echo "~/.bash_profile created"
fi

if [ ! -f ~/.bashrc ]; then
    echo "~/.bashrc not found"
    cp ~/git/sdal_configs/.bashrc ~/
    echo "~/.bashrc created"
fi


echo "Added by sdal_configs setup" >> ~/.bashrc

echo "source ~/git/sdal_configs/.bash_aliases_sdal" >> ~/.bashrc
