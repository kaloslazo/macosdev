# >> exports
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export ANTIDOTE_HOME=~/.cache/antidote

# >> bindkeys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '\t\t' autosuggest-accept

# >> alias
alias ls="exa --icons --grid"
alias gits="git status"
alias gita="git add ."
alias gitc="git commit -m"
alias gom="git push origin main"
alias gitd="git diff"

# >> plugin manager
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
source ~/.zsh_plugins.zsh
antidote load

# >> invoques
eval "$(starship init zsh)"