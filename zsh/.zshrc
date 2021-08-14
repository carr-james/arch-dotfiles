#!/bin/zsh

fpath=($ZDOTDIR/external $fpath)

setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

# completion
autoload -Uz compinit; compinit
# autocomplete hidden files
_comp_options+=(globdots)
source $ZDOTDIR/external/completion.zsh 
# autosuggestions
source $ZDOTDIR/external/zsh-autosuggestions/zsh-autosuggestions.zsh

# prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup

# clear terminal with ctrl+g instead of ctrl+l
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'

# directory stack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# aliases
source $ZDOTDIR/aliases

# vi mode
bindkey -v
export KEYTIMEOUT=1
autoload -Uz cursor_mode && cursor_mode

# vi bindings for completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# edit commands with neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# bd (back directory) - jump to parent directory
source $ZDOTDIR/external/bd.zsh

# fzf - fuzzy finder
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# startup
if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || exec ssh-agent startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

# custom scripts
source $ZDOTDIR/scripts.zsh

# set title
DISABLE_AUTO_TITLE="true"
case $TERM in
  rxvt*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

# syntax highlighting - should be near bottom of file
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
