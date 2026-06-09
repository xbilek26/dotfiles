case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

set_prompt() {
    local RESET='\[\033[00m\]'
    local BLUE='\[\033[34m\]'
    local GREEN='\[\033[32m\]'
    local YELLOW='\[\033[33m\]'
    local HOST_INDICATOR=""
    if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_TTY" ]; then
        HOST_INDICATOR="${YELLOW}[ssh] ${RESET}"
    fi
    local VENV=""
    if [ -n "$VIRTUAL_ENV" ]; then
        VENV="(${GREEN}$(basename "$VIRTUAL_ENV")${RESET}) "
    fi
    if [ "$PWD" = "$HOME" ]; then
        PS1="${HOST_INDICATOR}${VENV}\$ "
    else
        PS1="${HOST_INDICATOR}${VENV}${BLUE}\w\n${RESET}\$ "
    fi
}
PROMPT_COMMAND=set_prompt

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias vim='nvim'

export NVM_DIR="$HOME/.local/share/nvm/.nvm"
export PYTHON_HISTORY="$HOME/.local/share/python/.python_history"
