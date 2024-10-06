#
# $XDG_CONFIG_HOME/zsh/arch-zsh-prompt.zsh
#

() {
    emulate -L zsh
    # Determine terminal capabilities.
    {
        if
            ! zmodload zsh/langinfo zsh/terminfo || [[ $langinfo[CODESET] != (utf|UTF)(-|)8 || $TERM == (dumb|linux) ]] || (( terminfo[colors] < 256 ));
        then
            clear
            [[ ! -f ~/.config/zsh/p10k-tty.zsh ]] || source ~/.config/zsh/p10k-tty.zsh
            base16_mocha_neu
            ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bold'
            fastfetch --load-config $HOME/.config/fastfetch/config-tty.jsonc
            # Don't use the powerline config. It won't work on this terminal.
            local USE_POWERLINE=false
        else
            # Use 256 colors and UNICODE.
            clear
            #source $HOME/.config/zsh/p10k.zsh
            [[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
            base16_mocha_neu
            ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
            fastfetch
        fi
    } 2>/dev/null
}

# vim:filetype=zsh foldmethod=marker autoindent expandtab tabstop=4 softtabstop=4 shiftwidth=4
