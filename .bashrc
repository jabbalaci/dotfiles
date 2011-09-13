# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#############################
## Jabba
#############################
#umask 077

JAVA_HOME=/opt/java
JDK_HOME=$JAVA_HOME
PROTEGE_HOME=/opt/Protege
export JAVA_HOME JDK_HOME PROTEGE_HOME

EDITOR=/usr/bin/vi
SHELL=/bin/bash
export EDITOR SHELL 

EXIST_HOME=/opt/eXist
export EXIST_HOME

PATH=$JAVA_HOME/bin:$HOME/bin:$PATH
PATH=$PATH:$HOME/bin.python:/opt/wkhtmltopdf
GFORGE=https://scm.gforge.inria.fr/svn/coron

export PATH GFORGE 

export GCAL="-s1"

PYTHONPATH=$PYTHONPATH:$HOME/python/lib/jabbapylib
export PYTHONPATH

# HLA (high level assembly)
HLA_HOME=/trash2/opt/hla
hlalib=$HLA_HOME/hlalib
hlainc=$HLA_HOME/include
hlatemp=/tmp
export HLA_HOME hlalib hlainc hlatemp


function msdos_pwd
{
    local dir="`pwd`"
    dir=${dir/$HOME/'~'}

    echo $dir | tr '/' '\\'
}

export PS1='C:`msdos_pwd`> '

#############################################################################
## ETP 2010
ANT_OPTS="-Xms256M -Xmx512M"
LIFERAY_HOME=/opt/liferay
CATALINA_BASE=$LIFERAY_HOME/tomcat
CATALINA_OPTS=-Duser.timezone=America/Montreal
PATH=$PATH:$CATALINA_BASE/bin
CLASSPATH=$CLASSPATH:$HOME/.ant/lib/ant-contrib.jar:$HOME/.ant/lib/antelope_app.jar

export  ANT_OPTS  LIFERAY_HOME  CATALINA_BASE  CATALINA_OPTS  PATH  CLASSPATH
#############################################################################

# Il y a un bug avec Eclipse, parfois les boutons "Ok", "Next", "Add", etc. ne marchent pas.
# Here is the cure:
export GDK_NATIVE_WINDOWS=1

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias md='mkdir'
alias d='ls -al'
alias run='chmod u+x'
alias cpc='CWD_LAC=`pwd`'
alias cdc='cd $CWD_LAC'
alias rid='chmod 644'
alias ridd='chmod 755'
alias gq='gqview &'
alias mc='. /usr/share/mc/bin/mc-wrapper.sh'
alias tailf='tail -f'
alias cls='clear'
alias su='su -'
alias nh='nautilus .'
alias p='bpython'
alias ip='ipython'
#function hi() { echo hi "$1"; }
#function hi_all() { echo hi "$@"; }
function n() { /usr/bin/nautilus "$1"; }
alias th='echo "cls; cd `pwd`"'
alias kf='killall firefox-bin'
alias kill9='kill -9'
alias when='/home/jabba/Dropbox/when.forditas/when.hun.plus'

# https://github.com/huyng/bashmarks
source ~/.local/bin/bashmarks.sh
# http://linuxgazette.net/109/misc/marinov/acd_func.html
source ~/.local/bin/acd_func.sh
alias ll='cd --'

/usr/games/fortune | /usr/games/cowthink
# [[ -f "/home/jabba/.config/autopackage/paths-bash" ]] && . "/home/jabba/.config/autopackage/paths-bash"


export PERL_LOCAL_LIB_ROOT="/home/jabba/perl5";
export PERL_MB_OPT="--install_base /home/jabba/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/jabba/perl5";
export PERL5LIB="/home/jabba/perl5/lib/perl5/i686-linux-gnu-thread-multi:/home/jabba/perl5/lib/perl5";
export PATH="/home/jabba/perl5/bin:$PATH";
