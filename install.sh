#!/bin/bash

DOTFILES="$HOME/.dotfiles"

# nvim
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$HOME/.config/nvim"

# X11
rm -rf "$HOME/.config/X11"
ln -s "$DOTFILES/X11" "$HOME/.config"
