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
ln -s ~/projects/dotfiles/config.fish ~/.config/fish/

# i3/i3status

mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status

ln -s ~/projects/dotfiles/i3/config ~/.config/i3
ln -s ~/projects/dotfiles/i3status/config.desktop ~/.config/i3status/config

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
ln -s ~/projects/dotfiles/zathura/zathurarc ~/.config/zathura/

# GDB
ln -s ~/projects/dotfiles/.gdbinit ~/
