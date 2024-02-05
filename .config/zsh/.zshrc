# history settings
#!/bin/sh
# Enable zap plugin mananger https://github.com/zap-zsh/zap
# INSTALL ZAP
# zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
# MAKE ZSH DEFAULT
# chsh -s $(which zsh)
# PUT A .zshenv IN $HOME WITH $ZDOTDIR
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

export PATH="$HOME/.config/cargo/bin:$PATH"
export RUSTUP_HOME=~/.config/rustup
export CARGO_HOME=~/.config/cargo
export XDG_DATA_HOME=~/.local/share
export XDG_CONFIG_HOME=~/.config
export XDG_STATE_HOME=~/.local/state
export XDG_CACHE_HOME=~/.cache
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"

export BAT_THEME="gruvbox-dark"
export ZDOTDIR=$HOME/.config/zsh
HISTSIZE=5000
export HISTFILE=$XDG_STATE_HOME/zsh/history
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
plug "$ZDOTDIR/prompt.zsh"
plug "$ZDOTDIR/aliases.zsh"

plug "zap-zsh/exa"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "zsh-users/zsh-completions"

# case sensitive settings
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

zstyle ':completion:*' menu select

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

export TERMINAL="alacritty"
export BROWSER="firefox"

#PLUGINS

fpath=(path/to/zsh-completions/src $fpath)

export NVM_DIR="/home/gregovilardo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

