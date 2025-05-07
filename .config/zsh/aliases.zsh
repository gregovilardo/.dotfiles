# ALIASES
#

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -la"
alias lt="ls -la -s time"
alias zshconfig="nvim $ZDOTDIR/.zshrc"
alias cdf='selected_path=$(rg --files --no-ignore-vcs | fzf --exact) && [ -n "$selected_path" ] && cd "$(echo "$selected_path" | sed "s,/[^/]*$,," )"'
# alias bat="batcat"
alias wget'=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias adb='HOME=/home/gregovilardo/.local/share/android adb'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias fd="fdfind"
alias nf='selected_file=$(fd . | fzf) && [ -n "$selected_file" ] && nvim "$selected_file"'

alias obsidian_flatpak="flatpak run md.obsidian.Obsidian"
alias vim=nvim
