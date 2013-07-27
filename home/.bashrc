[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

function _update_ps1() {
  export PS1="$(~/powerline-shell.py $?)"
}

export PROMPT_COMMAND="_update_ps1"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export TERM=xterm-256color
