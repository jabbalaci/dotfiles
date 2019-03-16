# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jabba/.fzf/bin* ]]; then
  export PATH="$PATH:/home/jabba/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jabba/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jabba/.fzf/shell/key-bindings.bash"

