# ~/.bash_aliases.

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)"  eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
fi

# some more ls aliases
alias ll='ls -alhF'
alias kk='ls -alhF'
alias mm='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias les='less'
alias vi='vim'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal  echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
####################

alias please='sudo'
alias whereami='pwd'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
#alias kubectl="minikube kubectl --"