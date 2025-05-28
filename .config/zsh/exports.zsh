export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/gregovilardo/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"


export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export GHCUP_USE_XDG_DIRS="true"
export GOPATH="$XDG_DATA_HOME/go"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export RUSTUP_HOME="$XDG_CONFIG_HOME/rustup"
export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export OMNET_PATH="$XDG_DATA_HOME/omnetpp-6.0.1/bin"
export CARGO_PATH="$XDG_CONFIG_HOME/cargo/bin"

# Wayland Fix
export XDG_CURRENT_DESKTOP="sway"
export QT_QPA_PLATFORM="wayland"

#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

#for gtk-layer-shell
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export LD_LIBRARY_PATH="/usr/local/lib"

export BAT_THEME="gruvbox-dark"
export ZDOTDIR="$HOME/.config/zsh"

export HISTFILE="$XDG_STATE_HOME/zsh/history"

export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME="qt5ct"

export SPARK_HOME="$XDG_DATA_HOME/spark-3.5.1-bin-hadoop3"

if [[ ! "$PATH" == *$CARGO_PATH:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.local/bin:$GOPATH/bin:/usr/local/go/bin:$OMNET_PATH* ]]; then
  export PATH="$PATH:$CARGO_PATH:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.local/bin:$GOPATH/bin:/usr/local/go/bin:$OMNET_PATH"
fi

export DENO_INSTALL="/home/gregovilardo/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export PATH="$PATH:$XDG_DATA_HOME/zen"

export STARSHIP_CONFIG=~/.config/starship/starship.toml

export SOPS_PGP_FP="764AABDE4F76CE5B7E08969C24F5510A5E6CF019"

export PATH="$PATH:$XDG_DATA"

export MASON="$XDG_DATA_HOME/nvim/mason"
