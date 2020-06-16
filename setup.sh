#!/bin/bash

###############
# Install bin #
###############
pacman -S rofi dunst python-pywal
yay -S i3-gaps-rounded-git compton-tryone-git polybar



######################
# Setup config files #
######################

# Make directories
mkdir ~/.config/compton
mkdir ~/.config/polybar
mkdir ~/.config/dunst
mkdir ~/.config/i3
mkdir ~/.config/rofi
mkdir ~/.config/rofi/scripts


#i3wm
curl 'https://raw.githubusercontent.com/yttrion/dotfiles/master/beach/config/i3/config' > config && mv config ~/.config/i3/

#polybar
curl 'https://raw.githubusercontent.com/yttrion/dotfiles/master/beach/config/polybar/config' > config && mv config ~/.config/polybar 
curl 'https://raw.githubusercontent.com/yttrion/dotfiles/master/beach/config/polybar/launch.sh' > launch.sh && chmod +x launch.sh && mv launch.sh config ~/.config/polybar

#dunst
curl 'https://raw.githubusercontent.com/yttrion/dotfiles/master/beach/config/dunst/dunstrc' > dunstrc && mv dunstrc ~/.config/dunst

#compton
curl 'https://raw.githubusercontent.com/yttrion/dotfiles/master/beach/config/compton/compton.conf' > compton.conf && mv compton.conf ~/.config/compton/

#rofi
curl 'https://github.com/yttrion/dotfiles/blob/master/beach/config/rofi/inputnobar.rasi' > inputnobar.rasi && mv inputnobar.rasi ~/.config/rofi
curl 'https://github.com/yttrion/dotfiles/blob/master/rainy/config/rofi/scripts/powermenu.sh' > powermenu.sh && chmod +x powermenu.sh && mv powermenu.sh ~/.config/rofi/scripts

#Overwrite vimrc, bashrc, Xressources
curl 'https://raw.githubusercontent.com/yttrion/dotfiles/master/beach/config/bashrc' > .bashrc
curl 'https://raw.githubusercontent.com/yttrion/dotfiles/master/beach/config/vimrc' > .vimrc
curl 'https://raw.githubusercontent.com/yttrion/dotfiles/master/beach/config/Xresources' > .Xresources

#Vim-plug setup
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Reload config
xrdb -load .Xresources
