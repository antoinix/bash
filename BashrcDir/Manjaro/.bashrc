#                    --Only for manjaro
#                       --$HOME/.bashrc
#                         --Antoine Lee
#                 --Mon Feb 10 2020 CST
#    --https://github.com/antoinix/bash


# ===
# === Timer
# ===
init_date=$(date --utc -d $(passwd -S antoine | cut -f3 -d' ') +%s)
now_date=$(date --utc -d $(date -I) +%s)
echo "The Manjaro Linux has been installed on this machine for $(($((now_date-init_date))/86400)) days"


# ===
# === Dress bash up
# ===
#== Bash-git
if [ -f "$HOME/.config/bash/bash-git/gitprompt.sh" ]; then
   GIT_PROMPT_ONLY_IN_REPO=1
   GIT_PROMPT_THEME_NAME='Custom'
   source $HOME/.config/bash/bash-git/gitprompt.sh
fi

#== Bash-it
case $- in
  *i*) ;;
    *) return;;
esac
export BASH_IT="$HOME/.config/bash/bash-it"
export BASH_IT_THEME='atomic'
export TODO="t"
source "$BASH_IT"/bash_it.sh


# ===
# === fzf
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

#== Default Bash Configuration
source $BASH_DIR/BashrcDir/Manjaro/.default

#== matlab path
if [ -e ~/matlab ]; then
    export PATH=$PATH:$HOME/matlab/bin
fi

#== bash alias
source $BASH_DIR/BashrcDir/Manjaro/.alias

#== theme build
source $BASH_DIR/BashrcDir/Manjaro/.build

#== completion
source $HOME/.config/ranger/see/complete
source $HOME/Coding/Icon/Markdown/complete
