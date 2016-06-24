# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jabba/Dropbox/home/jabba/.fzf/bin* ]]; then
  export PATH="$PATH:/home/jabba/Dropbox/home/jabba/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/jabba/Dropbox/home/jabba/.fzf/man* && -d "/home/jabba/Dropbox/home/jabba/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/jabba/Dropbox/home/jabba/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jabba/Dropbox/home/jabba/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jabba/Dropbox/home/jabba/.fzf/shell/key-bindings.bash"

