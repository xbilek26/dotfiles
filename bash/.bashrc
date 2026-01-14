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
    local PURPLE='\[\033[35m\]'

    if [ "$PWD" = "$HOME" ]; then
        PS1="\$ "
    else
        PS1="${PURPLE}\w${RESET}\$ "
    fi
}

PROMPT_COMMAND=set_prompt

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -lh --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias vim='nvim'
alias gdb="gdb -q"
unset DEBUGINFOD_URLS
