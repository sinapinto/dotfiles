# exit if we were called form an interactive shell
[[ $- != *i* ]] && return 1

ZDOTDIR=${ZDOTDIR:-$HOME}


# compile the completion dump to increase startup speed.
{
   dump_file="$HOME/.zcompdump"
   if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -s "${dump_file}.zwc" ]]; then
      zcompile "$dump_file"
   fi
} &!

# shell colors
autoload -U colors && colors
eval `dircolors -b ~/.dir_colors`
. "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# prompt
case $TERM in
    rxvt*|screen)
        setopt prompt_subst # parameter expansion in prompt
        . $HOME/agnoster.zsh-theme # powerline prompt
        ;;
    linux) ;;
esac

# zsh completion
autoload -Uz compinit && compinit
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# keybinds
bindkey "^J" backward-word
bindkey "^H" backward-kill-word
bindkey "^K" forward-word
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# source
[ ! -f "$HOME/shell_aliases" ]   || . $HOME/shell_aliases
[ ! -f "$HOME/shell_functions" ] || . $HOME/shell_functions
