# User specific configuration files directory
export XDG_CONFIG_HOME="$HOME/.config"

# User specific data files directory
export XDG_DATA_HOME="$HOME/.local/share"

# User specific non-essential (cached) files directory
export XDG_CACHE_HOME="$HOME/.cache"

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Zsh configurations directory
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Zsh history
export HISTFILE="$XDG_DATA_HOME/zsh/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Xauthority file
export XAUTHORITY="$XDG_DATA_HOME/.Xauthority"

# Less history
export LESSHISTFILE="$XDG_DATA_HOME/.lesshst"

# Dotfiles directory - source controlled
export DOTFILES="$HOME/.dotfiles"

# fzf faster searching with ripgrep
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
