Para agregar algo a stow simplemente `stow .`

#TODO: Agregar un script para instalar todos los programas y dependencias

## Papirus icons
```zsh
sudo sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu jammy main' > /etc/apt/sources.list.d/papirus-ppa.list"
sudo wget -qO /etc/apt/trusted.gpg.d/papirus-ppa.asc 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9461999446FAF0DF770BFC9AE58A9D36647CAE7F'
sudo apt-get update
sudo apt-get install papirus-icon-theme
```

## Starship

`curl -sS https://starship.rs/install.sh | sh`
