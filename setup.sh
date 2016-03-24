#! /usr/bin/env bash

# get directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# .BASH_PROFILE & .BASHRC
if [ ! -f ~/.bash_profile ]; then
    echo "~/.bash_profile not found"
    cp $DIR/.bash_profile ~/
    echo "~/.bash_profile created"
fi

if [ ! -f ~/.bashrc ]; then
    echo "~/.bashrc not found"
    cp $DIR/.bashrc ~/
    echo "~/.bashrc created"
fi

echo "\"Added by sdal_configs setup\"" >> ~/.bashrc

echo "source $DIR/.bash_aliases_sdal" >> ~/.bashrc

# SSH CONFIG FILE
if [ ! -f ~/.ssh/config_home ]; then
    echo "~/.ssh/config_home not found"
    touch ~/.ssh/config_home
    echo "~/.ssh/config_home created"
fi

cat ~/.ssh/config_home > ~/.ssh/config
printf "\n\n# SDAL CONFIG BELOW\n\n">> ~/.ssh/config

# use user supplied pid
sed -i -e "s/<your_pid>/$1/g" $DIR/config

cat $DIR/config >> ~/.ssh/config

# reset the file
sed -i -e "s/$1/<your_pid>/g" $DIR/config
