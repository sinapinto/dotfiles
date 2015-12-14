[[ $- != *i* ]] && return 1

# since zsh is also the login shell, avoid concatenating twice
if [[ -o login ]]; then
  export PATH=$PATH:$HOME/bin
fi

autoload -U colors && colors
if ! [[ `tty` =~ ^/dev/tty.* ]]; then
  eval `dircolors -b ~/.dir_colors`
fi

stty -ixon
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
zmodload -i zsh/complist
bindkey -M menuselect '^M' .accept-line
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' list-colors no=00 fi=00 di=01\;34 pi=33 so=01\;35 bd=00\;35 cd=00\;34 or=00\;41 mi=00\;45 ex=01\;32
setopt menu_complete # immediately select first menu item
bindkey "^J" backward-word
bindkey "^H" backward-kill-word
bindkey "^K" forward-word
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# custom ZLE widgets -----------------------------------------
_change-first-word() {
  zle beginning-of-line
  zle kill-word
}
zle -N _change-first-word
bindkey -M viins "\ea" _change-first-word

_vim-instead() {
  zle beginning-of-line
  zle kill-word
  LBUFFER="vim $LBUFFER"
  zle accept-line
}
zle -N _vim-instead
bindkey -M viins "\ev" _vim-instead

_man-instead() {
  LBUFFER="man $LBUFFER"
  zle accept-line
}
zle -N _man-instead
bindkey -M viins "\em" _man-instead

_backward-kill-to-slash() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-kill-word
}
zle -N _backward-kill-to-slash
bindkey -M viins "^W" _backward-kill-to-slash

_tilde-questionmark() { # fix ~? to ~/
  if [[ $LBUFFER[-1] == \~ ]]; then
    zle -U '/'
  else
    zle self-insert
  fi
}
bindkey \? _tilde-questionmark
zle -N _tilde-questionmark

# _dot-dot() {
#   zle -U '../'
# }
# bindkey -M viins "\e;" _dot-dot
# zle -N _dot-dot

# vi mode status indicator -----------------------------------
# http://ivyl.0xcafe.eu/2013/02/03/refining-zsh/
# urxvt (and family) accepts even #RRGGBB
local INSERT_PROMPT="green"
local COMMAND_PROMPT="orange"

# helper for setting color including all kinds of terminals
set_prompt_color() {
  if [[ $TERM = "linux" ]]; then
    # nothing
  elif [[ $TMUX != '' ]]; then
    printf '\033Ptmux;\033\033]12;%b\007\033\\' "$1"
  else
    echo -ne "\033]12;$1\007"
  fi
}

# change cursor color basing on vi mode
zle-keymap-select () {
  if [ $KEYMAP = vicmd ]; then
    set_prompt_color $COMMAND_PROMPT
  else
    set_prompt_color $INSERT_PROMPT
  fi
}

zle-line-finish() {
  set_prompt_color $INSERT_PROMPT
}

zle-line-init () {
  zle -K viins
  set_prompt_color $INSERT_PROMPT
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish

# ------------------------------------------------------------

autoload edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line
bindkey -s "\eu" '^Ucd ..^M'
bindkey -s "\ef" '^J~/^E'
bindkey '\e.' insert-last-word
bindkey '^[[Z' reverse-menu-complete # shift-tab

_git_prompt() {
  # reference
  local GIT_REF=${$(git symbolic-ref HEAD 2>/dev/null)#refs/heads/}
  if [ -z $GIT_REF ]; then
    GIT_REF=${$(git rev-parse HEAD 2>/dev/null)[1][1,7]}
  fi
  [ -z $GIT_REF ] && return
  # stash (this slows down the prompt significantly)
  # local GIT_STASH=${$(git stash list 2>/dev/null)[1][7,9]}
  echo "%k%b(%B%F{cyan}%20>..>${GIT_REF}%<<%k%b)"
}

if [ $TERM != "linux" ]; then
  GRUVBOX_PATH="$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
  [ -f $GRUVBOX_PATH ] && source $GRUVBOX_PATH
  unset GRUVBOX_PATH

  # syntax highlighting - should be sourced after all custom widgets have been created
  # (widgets created later will work, but will not update the syntax highlighting)
  HIGHLIGHTER_PATH="$HOME/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  [ -f $HIGHLIGHTER_PATH ] && source $HIGHLIGHTER_PATH || return
  unset HIGHLIGHTER_PATH
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
  typeset -A ZSH_HIGHLIGHT_STYLES
  ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
  ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
  ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
  ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
  ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,bold'
  ZSH_HIGHLIGHT_STYLES[path]='fg=yellow,underline'
  ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=yellow,underline'

  # prompt
  setopt prompt_subst
  PROMPT="%(?..%B%F{red}(%?%))"       # exit code
  PROMPT+="%(1j.%B%F{green}(%j).)"    # background jobs
  PROMPT+="%B%F{magenta}%50<..<%~%<<" # working directory
  PROMPT+='$(_git_prompt)'            # git
  PROMPT+="%b%f$ "
fi

[ -f ~/shell_aliases ]   && source ~/shell_aliases
[ -f ~/shell_functions ] && source ~/shell_functions
[ -f ~/.fzf.zsh ]        && source ~/.fzf.zsh

