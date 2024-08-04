#!/bin/sh

# Emacs
ln -s ~/projects/dotfiles/.emacs.d/ufp_logo.txt ~/.emacs.d
ln -s ~/projects/dotfiles/.emacs.d/init.el ~/.emacs.d
ln -s ~/projects/dotfiles/.emacs.d/main.el ~/.emacs.d
ln -s ~/projects/dotfiles/.emacs.d/packages.el ~/.emacs.d
ln -s ~/projects/dotfiles/.emacs.d/linux-style.el ~/.emacs.d
ln -s ~/projects/dotfiles/.emacs.d/pg-style.el ~/.emacs.d
ln -s ~/projects/dotfiles/.emacs.d/customizations.el ~/.emacs.d
ln -s ~/projects/dotfiles/.emacs.d/lisp ~/.emacs.d/
ln -s ~/projects/dotfiles/.emacs.d/snippets/ ~/.emacs.d/

# Zsh
ln -s ~/projects/dotfiles/.zshrc ~/

# Fish
mkdir -p ~/.config/fish

ln -s ~/projects/dotfiles/config.fish ~/.config/fish/

# Sway

mkdir -p ~/.config/sway
mkdir -p ~/.config/waybar

ln -s ~/projects/dotfiles/sway/config ~/.config/sway
ln -s ~/projects/dotfiles/waybar/config ~/.config/waybar/config
ln -s ~/projects/dotfiles/waybar/style.css ~/.config/waybar/style.css

# tmux
ln -s ~/projects/dotfiles/.tmux.conf ~/

# vim
ln -s ~/projects/dotfiles/.vimrc ~/

# Alacritty
mkdir -p ~/.config/alacritty
ln -s ~/projects/dotfiles/alacritty/alacritty.toml ~/.config/alacritty

# git
ln -s ~/projects/dotfiles/.gitignore_global ~/
git config --global core.excludesFile '~/.gitignore_global'

# zathura
mkdir ~/.config/zathura/

ln -s ~/projects/dotfiles/zathura/zathurarc ~/.config/zathura/

# GDB
ln -s ~/projects/dotfiles/.gdbinit ~/
