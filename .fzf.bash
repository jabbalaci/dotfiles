# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jabba/Dropbox/home/jabba/.fzf/bin* ]]; then
  export PATH="$PATH:/home/jabba/Dropbox/home/jabba/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jabba/Dropbox/home/jabba/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jabba/Dropbox/home/jabba/.fzf/shell/key-bindings.bash"

