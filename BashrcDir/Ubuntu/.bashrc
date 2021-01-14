#                     --Only for ubuntu
#                       --$HOME/.bashrc
#                         --Antoine Lee
#                 --Thu Jan 14 2021 CST
#    --https://github.com/antoinix/bash


# ===
# === Dress bash up
# ===
PS1="\[\e[37m\]\342\224\214\342\224\200\342\224\200[\[\e[33m\]\u\[\e[31m\]@\[\e[32m\]\h\[\e[37m\]] \342\224\200 [\[\e[34m\]\w\[\e[0m\]]\n\342\224\224\342\224\200\342\224\200[\[\e[36m\]\t\[\e[0m\]] \342\224\200 \[\e[35m\]$\[\e[0m\] "


# ===
# === Path & Source
# ===
#== BASH_DIR path
export BASH_DIR="$HOME/.config/bash"

#== Default Bash Configuration
source $BASH_DIR/BashrcDir/Ubuntu/.default

#== bash alias
source $BASH_DIR/BashrcDir/Ubuntu/.alias
