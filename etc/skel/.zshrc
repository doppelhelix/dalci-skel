#
# ~/.zshrc
#
# shellcheck shell=zsh

########################
## zsh plugin-manager ##
########################
eval "$(sheldon source)"

###################################
## Source arch-zsh-configuration ##
###################################
if [[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/arch-zsh-config.zsh" ]]; then
    source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/arch-zsh-config.zsh"
fi

####################################
## Source arch zsh prompt (BLING) ##
####################################
if [[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/arch-zsh-prompt.zsh" ]]; then
    source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/arch-zsh-prompt.zsh"
fi

####################################################################################
## Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. ##
## Initialization code that may require console input (password prompts, [y/n]    ##
## confirmations, etc.) must go above this block; everything else may go below.   ##
####################################################################################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##################################
## Look for a file with aliases ##
##################################
if [[ -r "$HOME/.aliasrc" ]]; then
    . $HOME/.aliasrc
fi

# vim: set ts=4 sw=4 et:

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
