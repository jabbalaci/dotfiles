# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#############################################################################
# jabba
#############################################################################
#umask 077

#set -o vi
EDITOR=/usr/bin/vim
export EDITOR

JAVA_HOME=/opt/java
JDK_HOME=$JAVA_HOME
PATH=$JAVA_HOME/bin:$PATH:$HOME/bin:$HOME/bin.python

export JAVA_HOME JDK_HOME PATH

#function msdos_pwd
#{
#    local dir="`pwd`"
#    dir=${dir/$HOME/'~'}
#
#    echo $dir | tr '/' '\\'
#}
#
#export PS1='C:`msdos_pwd`> '

# finance project, HTML to PDF
#PATH=$PATH:/opt/wkhtmltopdf
#export PATH

PYTHONPATH=$PYTHONPATH:$HOME/python/lib/jabbapylib:$HOME/python/lib
export PYTHONPATH

PYPY=/opt/pypy/bin
PATH=$PATH:$PYPY
export PATH

#PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/dist-packages/spyderlib
#export PYTHONPATH

# don't create .pyc and .pyo files
#PYTHONDONTWRITEBYTECODE=True
#export PYTHONDONTWRITEBYTECODE

export PYTHONSTARTUP=$HOME/.pythonstartup.py

PATH=$PATH:$HOME/lib/google_appengine
export PATH

PATH=$PATH:/opt/chromedriver
export PATH

# added by Anaconda 1.7.0 installer
#export PATH="/opt/anaconda/bin:$PATH"

# pless (pygmentized less)
export LESS='-R'

alias md='mkdir'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias d='ls -al'
#alias mc='. /usr/share/mc/bin/mc-wrapper.sh'
alias mc='. /usr/local/libexec/mc/mc-wrapper.sh'
alias run='chmod u+x'
alias rid='chmod 644'
alias ridd='chmod 755'
alias gq='gqview &'
alias tailf='tail -f'
alias cls='clear'
alias nh='nautilus . 2>/dev/null'
alias gt='gthumb &'
alias p='python'
alias pudb='python -m pudb'
alias p3='python3'
alias bpy='bpython'
alias ipy='ipython'
alias th='echo "cls; cd `pwd`"'
alias kr='krusader &'
alias kill9='kill -9'
alias sshow_r='feh -zsZFD 5 .'
alias sshow_n='feh -FD 5 .'
alias ed='$HOME/bin/st'
alias rukkola='okular $HOME/Dropbox/books/_postai_dijszabas/Tarifatabla_20120801.pdf 2>/dev/null &'
alias tm='tmux'
alias t='cls; rlwrap task'
alias killvlc='kill -9 `ps ux | grep vlc | grep -v grep | tr -s " " | cut -d" " -f2`'
alias killmplayer='ps ux | grep mplayer | grep -v grep | tr -s " " | cut -d" " -f2 | xargs kill -9'
alias k='konsole 2>/dev/null &'
alias Q='tail -f $HOME/bin/copy_queue/daemon.log'
alias sagi='sudo apt-get install'
alias pcat="pygmentize -f terminal256 -O style=native -g"
alias beep="mplayer -ao alsa $HOME/bin/alert.wav &>/dev/null"
alias pip_pypy='/opt/pypy/bin/pip'
alias ppwd='/bin/pwd'
func_workon()
{
if [[ -z "$1" ]]
then
    echo "Usage: workon <venv>"
else
    . $1/bin/activate
fi
}
alias workon=func_workon
alias off='deactivate'
mdgo_function()
{
if [[ -z "$1" ]]
then
    echo "Usage: mdgo <DIR>"
else
    mkdir $1; cd $1
fi
}
alias mdgo=mdgo_function

# .xsession-errors can grow huge... remove it
if [ ! -h $HOME/.xsession-errors ]
then
    /bin/rm $HOME/.xsession-errors 2>/dev/null
    ln -s /dev/null $HOME/.xsession-errors 2>/dev/null
fi
 
if [ ! -h $HOME/.xsession-errors.old ]
then
    /bin/rm $HOME/.xsession-errors.old 2>/dev/null
    ln -s /dev/null $HOME/.xsession-errors.old 2>/dev/null
fi

# https://gist.github.com/insin/1425703
source ~/.bash_prompt

/usr/games/fortune | /usr/games/cowthink

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# for Seafile
ulimit -n 30000
