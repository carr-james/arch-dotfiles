#!/bin/bash

DOTFILES=$HOME/.dotfiles

# nvim
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$HOME/.config/nvim"

# X11
rm -rf "$HOME/.config/X11"
ln -s "$DOTFILES/X11" "$HOME/.config"

# i3
rm -rf "$HOME/.config/i3"
ln -s "$DOTFILES/i3" "$HOME/.config"

# zsh
mkdir -p "$HOME/.config/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zprofile" "$HOME/.config/zsh"
ln -sf "$DOTFILES/zsh/.zprofile" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.config/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$HOME/.config/zsh/aliases"
rm -rf "$HOME/.config/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$HOME/.config/zsh"
ln -sf "$DOTFILES/zsh/scripts.zsh" "$HOME/.config/zsh"
