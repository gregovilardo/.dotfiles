#!/bin/sh
# Enable zap plugin mananger https://github.com/zap-zsh/zap
# INSTALL ZAP
# zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
# MAKE ZSH DEFAULT
# chsh -s $(which zsh)
# PUT A .zshenv IN $HOME WITH $ZDOTDIR
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Normal files to source
# plug "$ZDOTDIR/prompt.zsh"
plug "$ZDOTDIR/aliases.zsh"
plug "$ZDOTDIR/next_slash.zsh"
plug "$ZDOTDIR/exports.zsh"

# plug "zettlrobert/simple-prompt"
# plug "zap-zsh/vim"
plug "zap-zsh/exa"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "zsh-users/zsh-completions"


# case sensitive settings
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu select 
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

bindkey -v

#zstyle :compinstall filename '/home/gregovilardo/.zshrc'

autoload -Uz compinit
compinit

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

#for . to appear on autocompletition
_comp_options+=(globdots)

# FUNCTIONS
run_tmux_sessionizer() {
  tmux neww "~/.local/bin/scripts/tmux-sessionizer.bash"
  zle redisplay;        # It makes a new line (sort of)
}
zle -N run_tmux_sessionizer
# KEYMAPS

bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line
bindkey  "^[[3~"   delete-char
bindkey '^[[Z'     reverse-menu-complete
bindkey "^[[1;5D"  backward-word
bindkey "^[[1;5C"  forward-word
#bindkey -s "^[d" 'change_path ^M'     
bindkey "^[d"      backward-kill-word
bindkey "^d"       kill-word
bindkey "^N"       autosuggest-accept
bindkey "^Y"       autosuggest-execute
bindkey "^F"       run_tmux_sessionizer

export TERMINAL="alacritty"
export BROWSER="brave-browser"


fpath=(path/to/zsh-completions/src $fpath)

# export NVM_DIR="/home/gregovilardo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa

# PYENV
# export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
[[ -d $PYENV_ROOT/bin ]] && [[ ! "$PATH" == *$PYENV_ROOT/bin* ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(zoxide init --cmd cd zsh)"

eval "$(starship init zsh)"

# eval "$(ssh-agent -s)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ ! "$PATH" == */home/gregovilardo/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/gregovilardo/.fzf/bin"
fi

source <(fzf --zsh)



[ -f "/home/gregovilardo/.local/share/ghcup/env" ] && . "/home/gregovilardo/.local/share/ghcup/env" # ghcup-env

# if [ -z "$SSH_AUTH_SOCK" ]; then
#    eval "$(ssh-agent -s)"
#    ssh-add ~/.ssh/liricus 2>/dev/null
# fi
