#! /usr/bin/env bash

# .BASH_PROFILE & .BASHRC

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

# SSH CONFIG FILE

if [ ! -f ~/.ssh/config_home ]; then
    echo "~/.ssh/config_home not found"
    touch ~/.ssh/config_home
    echo "~/.ssh/config_home created"
fi

cat ~/.ssh/config_home > ~/.ssh/config
printf "\n\n# SDAL CONFIG BELOW\n\n">> ~/.ssh/config

# use user supplied pid
sed -i -e "s/<your_pid>/$1/g" ~/sdal_configs/config

cat ~/sdal_configs/config >> ~/.ssh/config

# reset the file
sed -i -e "s/$1/<your_pid>/g" ~/sdal_configs/config
