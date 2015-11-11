#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function rs {
    OS=$(uname -s)
    if [[ $OS == 'Linux' ]]; then
        pkill -f rs_tunnel; autossh -M 0 -N -f rs_tunnel && echo "rstudio tunnel created" && xdg-open http://localhost:8787/;
    fi
    if [[ $OS == 'Darwin' ]]; then
        pkill -f rs_tunnel; autossh -M 0 -N -f rs_tunnel && echo "rstudio tunnel created" && open -a "Google Chrome" 'http://localhost:8787/';
    fi
}

function pg {
    OS=$(uname -s)
    if [[ $OS == 'Linux' ]]; then
        pkill -f pg_tunnel; autossh -M 0 -N -f pg_tunnel && echo "postgresql tunnel created" && `nohup sh -c 'pgadmin3' > /dev/null &`;
    fi
    if [[ $OS == 'Darwin' ]]; then
        pkill -f pg_tunnel; autossh -M 0 -N -f pg_tunnel && echo "postgresql tunnel created" && `open -a pgadmin3`;
    fi
}

PS1='[\u@\h \W]\$ '

source ~/.ssh/mount_this_ssh.sh

