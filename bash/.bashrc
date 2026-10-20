case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000

set_prompt() {
    local RESET='\[\033[00m\]'
    local BLUE='\[\033[34m\]'
    if [ "$PWD" = "$HOME" ]; then
        PS1="\$ "
    else
        PS1="${BLUE}\w\n${RESET}\$ "
    fi
}
PROMPT_COMMAND=set_prompt

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

alias vim='nvim'

export PATH="$HOME/.local/share/nvm/.nvm/versions/node/v20.20.1/bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim
export PYTHONDONTWRITEBYTECODE=1

if [[ $- == *i* ]] && [ -z "$TMUX" ] && [ -t 1 ]; then
    if command tmux has-session 2>/dev/null; then
        command tmux attach
    else
        command tmux new-session \; \
        new-window "ssh obsahovka" \; \
        select-window -t 2
    fi
fi
