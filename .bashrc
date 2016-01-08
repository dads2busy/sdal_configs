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
        pkill -f rs_tunnel; autossh -M 0 -N -f rs_tunnel && echo "rstudio tunnel created" && open -a "/Applications/Google Chrome.app" 'http://localhost:8787/';
    fi
}

function pg {
    OS=$(uname -s)
    if [[ $OS == 'Linux' ]]; then
        pkill -f pg_tunnel; autossh -M 0 -N -f pg_tunnel && echo "postgresql tunnel created" && xdg-open http://localhost:8080/;
    fi
    if [[ $OS == 'Darwin' ]]; then
        pkill -f pg_tunnel; autossh -M 0 -N -f pg_tunnel && echo "postgresql tunnel created" && open -a "/Applications/Google Chrome.app" 'http://localhost:8080/';
    fi
}

function jp {
    OS=$(uname -s)
    if [[ $OS == 'Linux' ]]; then
        pkill -f jp_tunnel; autossh -M 0 -N -f jp_tunnel && echo "jupyter tunnel created" && xdg-open http://localhost:8000/;
    fi
    if [[ $OS == 'Darwin' ]]; then
        pkill -f jp_tunnel; autossh -M 0 -N -f jp_tunnel && echo "jupyter tunnel created" && open -a "/Applications/Google 
Chrome.app" 'http://localhost:8000/';
    fi
}

function rs_snowmane {
    OS=$(uname -s)
    if [[ $OS == 'Linux' ]]; then
        pkill -f rs_tunnel_snowmane; autossh -M 0 -N -f rs_tunnel && echo "rstudio tunnel created" && xdg-open http://localhost:8787/;
    fi
    if [[ $OS == 'Darwin' ]]; then
        pkill -f rs_tunnel_snowmane; autossh -M 0 -N -f rs_tunnel && echo "rstudio tunnel created" && open -a "/Applications/Google Chrome.app" 'http://localhost:8787/';
    fi
}

function pg_snowmane {
    OS=$(uname -s)
    if [[ $OS == 'Linux' ]]; then
        pkill -f pg_tunnel_snowmane; autossh -M 0 -N -f pg_tunnel && echo "postgresql tunnel created" && `nohup sh -c 'pgadmin3' > /dev/null &`;
    fi
    if [[ $OS == 'Darwin' ]]; then
        pkill -f pg_tunnel_snowmane; autossh -M 0 -N -f pg_tunnel && echo "postgresql tunnel created" && `open -a pgadmin3`;
    fi
}

PS1='[\u@\h \W]\$ '

# script for the mounting of servers in ~/.ssh/config
source ~/.ssh/mount_this_ssh.sh

