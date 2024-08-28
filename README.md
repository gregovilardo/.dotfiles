#TODO: Agregar un script para instalar todos los programas y dependencias

##### Instalar papirus icons
```zsh
sudo sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu jammy main' > /etc/apt/sources.list.d/papirus-ppa.list"
sudo wget -qO /etc/apt/trusted.gpg.d/papirus-ppa.asc 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9461999446FAF0DF770BFC9AE58A9D36647CAE7F'
sudo apt-get update
sudo apt-get install papirus-icon-theme
```

## Orchis
[Orchis GTK Theme](https://github.com/vinceliuice/Orchis-theme?tab=readme-ov-file)

[Orchis QT Theme](https://github.com/vinceliuice/Orchis-kde)
Instalar qt5ct kavantum y lxappearence
export QT_QPA_PLATFORMTHEME=qt5ct


Para tener en cuenta
[Icons del creador de orchis](https://github.com/vinceliuice/Tela-circle-icon-theme)
