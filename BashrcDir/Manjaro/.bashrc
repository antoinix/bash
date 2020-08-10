#                    --Only for manjaro
#                       --$HOME/.bashrc
#                         --Antoine Lee
#                 --Mon Feb 10 2020 CST
#    --https://github.com/antoinix/bash


# ===
# === Dress up bash
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
# === Fuzzy Finder (fzf)
# ===
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='find * --type f | fzf > selected'
export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --border --preview 'head -100 {}'"
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
source $BASH_DIR/.default

#== matlab path
if [ -e ~/matlab ]; then
    export PATH=$PATH:$HOME/matlab/bin
fi

#== texlive path
if [ -e ~/Texlive ]; then
    export PATH=$PATH:$HOME/Texlive/texlive/2019/bin/x86_64-linux
fi

#== bash alias
source $BASH_DIR/BashrcDir/Manjaro/.alias

#== theme build
source $BASH_DIR/BashrcDir/Manjaro/.build

#== 'see' completion
source $HOME/.config/ranger/see/complete
