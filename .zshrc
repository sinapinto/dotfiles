# exit if we were called form an interactive shell
[[ $- != *i* ]] && return

{
   # compile the completion dump to increase startup speed.
   dump_file="$HOME/.zcompdump"
   if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -s "${dump_file}.zwc" ]]; then
      zcompile "$dump_file"
   fi
} &!

# environment variables
export PATH=$PATH:$HOME/bin
export VISUAL=vim
export EDITOR=$VISUAL
export BROWSER=firefox
export PAGER=less
export TERMINAL=rxvt-256color

export HISTSIZE=1024
export SAVEHIST=1024
export HISTFILE=~/shell/.zsh_history
export HISTIGNORE="cd:l[sa]:m" # ignore commonly used commands

[[ -n "$XDG_CACHE_HOME" ]]  || export XDG_CACHE_HOME="$HOME/.cache"
[[ -n "$XDG_CONFIG_HOME" ]] || export XDG_CONFIG_HOME="$HOME/.config"
[[ -n "$XDG_DATA_HOME" ]]   || export XDG_DATA_HOME="$HOME/.local/share"

# shell colors
autoload -U colors && colors
eval `dircolors -b ~/.dir_colors`

# prompt
setopt prompt_subst # parameter expansion in prompt - for exit status, etc
source $HOME/shell/agnoster.zsh-theme # powerline prompt

# zsh completion
autoload -Uz compinit && compinit
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' menu select=2 # open menu selection on at least 2 items
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
source $HOME/shell/aliases
source $HOME/shell/functions
