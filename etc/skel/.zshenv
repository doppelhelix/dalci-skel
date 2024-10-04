#
# $HOME/.zshenv
#
# shellcheck shell=zsh

#################
## Environment ##
#################
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export EDITOR=nvim
export VISUAL=nvim
export PAGER=most
export MANPAGER=most
export MANWIDTH=80
#if [[ ! $XDG_CURRENT_DESKTOP == "KDE" ]]; then
#    export QT_QPA_PLATFORMTHEME=qt5ct
#fi
#################
## Expand PATH ##
#################
if [ -d "$HOME"/.local/bin ] ; then
    typeset -U path PATH
    path=(~/.local/bin $path)
    export PATH
fi

# vim: set ts=4 sw=4 et:
