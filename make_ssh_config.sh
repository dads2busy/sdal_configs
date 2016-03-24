#! /usr/bin/env bash
# This script takes the file ~/.ssh/config_home
# and appends the text found in ~/sdal_configs/config
# and creates a new ~/.ssh/config file
#
# HOW TO USE: bash make_ssh_config.sh username
#

if [ ! -f ~/.ssh/config_home ]; then
    echo "~/.ssh/config_home not found"
    touch ~/.ssh/config_home
    echo "~/.ssh/config_home created"
fi

cat ~/.ssh/config_home > ~/.ssh/config
printf "\n\n# SDAL CONFIG BELOW\n\n">> ~/.ssh/config

# use user supplied pid
sed -i -e "s/<your_pid>/$1/g" ~/sdal_configs/config

cat ~/git/sdal_configs/config >> ~/.ssh/config

# reset the file
sed -i -e "s/$1/<your_pid>/g" ~/sdal_configs/config
