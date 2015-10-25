# http://pastebin.com/GVVeP1eC

alias ls='ls --tabsize=0 --literal --show-control-chars --color=always --human-readable'
alias grep='grep --color=auto'
alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive'
alias ll='ls -lhX'
alias la='ls -lAhX'
alias l='ll -S'
alias less='less --quiet'
alias df='df --human-readable'
alias du='du --human-readable'
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5C" vi-forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5D" vi-backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[3;5~" delete-word
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
if [ "`id -u`" -eq 0 ]; then
        PS1="%{[31m%}%B%n%b %{[34;1m%}%1~ %{[30;1m%}%#%{[0m%} "
else
        PS1="%{[33m%}%B%n%b %{[34;1m%}%1~ %{[30;1m%}%#%{[0m%} "
fi
RPS1="%{[30;1m%}%~ %{[0;35m%}%? %{[30;1m%}%y %{[30;1m%}%D{%d/%m} %{[0;36m%}%T%{[0m%}"
if [ "$TERM" = "linux" -o "$TERM" = "screen" -o "$TERM" = "rxvt" ]
then
 bindkey ' [1~' beginning-of-line       # Home
 bindkey ' [4~' end-of-line             # End
fi
if [ "$TERM" = "xterm" ]
then
 bindkey ' [H'  beginning-of-line       # Home
 bindkey ' [F'  end-of-line             # End
fi
if [ "$COLORTERM" = "gnome-terminal" ]
then
 bindkey '^[OH'  beginning-of-line       # Home
 bindkey '^[OF'  end-of-line             # End
fi
case $TERM in
  xterm*)
      precmd () {print -Pn "\e]0;%n@%m: %~\a"}
      ;;
esac
if [ -x /bin/dircolors ]
then
 if [ -r ~/.dir_colors ]
 then
   eval "`dircolors ~/.dir_colors`"
 elif [ -r /etc/dir_colors ]
 then
   eval "`dircolors /etc/dir_colors`"
 else
   eval "`dircolors`"
 fi
fi
unsetopt beep
unsetopt hist_beep
unsetopt list_beep
unsetopt clobber
unsetopt ignore_eof
unsetopt rm_star_silent
setopt correct
setopt nullglob
unsetopt list_ambiguous
setopt auto_remove_slash
unsetopt glob_dots
setopt chase_links
setopt hist_verify
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home
unsetopt bg_nice
unsetopt hup
export HISTORY=2000
export SAVEHIST=5000
export HISTFILE=$HOME/.history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' use-compctl false
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no result for : %d%b'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                            /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
export EDITOR=`which vim`
export VISUAL=`which vim`
export PATH=$PATH:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/games:/sbin:/usr/sbin
autoload -U promptinit
promptinit
