#                     --Only for centos
#                       --$HOME/.bashrc
#                         --Antoine Lee
#                 --Fri Jul 31 2020 CST
#    --https://github.com/antoinix/bash


# ===
# === Dress up bash
# ===
PS1="\[\e[37m\]\342\224\214\342\224\200\342\224\200[\[\e[33m\]\u\[\e[31m\]@\[\e[32m\]\h\[\e[37m\]] \342\224\200 [\[\e[34m\]\w\[\e[0m\]]\n\342\224\224\342\224\200\342\224\200[\[\e[36m\]\t\[\e[0m\]] \342\224\200 \[\e[35m\]$\[\e[0m\] "


# ===
# === Fuzzy Finder (fzf)
# ===
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border --preview 'head -100 {}'"
export FZF_COMPLETION_TRIGGER='\'
export FZF_COMPLETION_OPTS='+c -x'
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
  }

_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
  }
_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" "$@" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}


# ===
# === Path & Source
# ===
#== BASH_DIR path
export BASH_DIR="$HOME/.config/bash"

#== Default Bash Config
source $BASH_DIR/BashrcDir/Centos/.default

#== bash alias
source $BASH_DIR/BashrcDir/Centos/.alias

export PATH=$PATH:$HOME/you-get
