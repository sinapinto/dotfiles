export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME"

export VISUAL=vim
export EDITOR=$VISUAL
export BROWSER=chromium
export PAGER=less
export READNULLCMD=$PAGER
export TERMINAL=rxvt-256color
export CC=gcc

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

export LESS_TERMCAP_mb=$(printf "\e[01;31m")
export LESS_TERMCAP_md=$(printf "\e[00;33m")
export LESS_TERMCAP_us=$(printf "\e[01;31m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_ue=$(printf "\e[0m")

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.sock"
