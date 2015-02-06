{
   # compile the completion dump to increase startup speed.
   dump_file="$HOME/.zcompdump"
   if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -s "${dump_file}.zwc" ]]; then
      zcompile "$dump_file"
   fi
} &!

export PATH=$PATH:$HOME/bin
export VISUAL=vim
export EDITOR=$VISUAL
export BROWSER=firefox
export TERMINAL=urxvt

autoload -U colors && colors
eval `dircolors -b ~/.dir_colors`

setopt prompt_subst
source $HOME/shell/agnoster.zsh-theme

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/shell/.zsh_history

autoload -Uz compinit
compinit
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

[[ -n "$XDG_CACHE_HOME" ]] || export XDG_CACHE_HOME="$HOME/.cache"
[[ -n "$XDG_CONFIG_HOME" ]] || export XDG_CONFIG_HOME="$HOME/.config"
[[ -n "$XDG_DATA_HOME" ]] || export XDG_DATA_HOME="$HOME/.local/share"

bindkey "^J" backward-word
bindkey "^H" backward-kill-word
bindkey "^K" forward-word
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

source $HOME/shell/aliases
source $HOME/shell/functions


