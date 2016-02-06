[[ $- != *i* ]] && return 1

autoload -U colors && colors
if ! [[ `tty` =~ ^/dev/tty.* ]]; then
  eval `dircolors -b ~/.dir_colors`
fi

stty -ixon
autoload edit-command-line
zle -N edit-command-line
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# options ----------------------------------------------------

setopt transient_rprompt # clear rprompt when accepting a command
setopt menu_complete     # on completion, insert first match immediately
setopt prompt_subst      # parameter/command/arithmetic expansion in prompt
setopt hist_ignore_all_dups
setopt interactive_comments

# completion -------------------------------------------------

zmodload -i zsh/complist
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' list-colors no=00 fi=00 di=01\;34 pi=33 so=01\;35 bd=00\;35 cd=00\;34 or=00\;41 mi=00\;45 ex=01\;32
zstyle ':completion:*:options' list-colors '=^(-- *)=1;34'
zstyle ':completion:*:builtins' list-colors '=*=1;32'

# custom widgets ---------------------------------------------

_change-first-word() {
  zle beginning-of-line
  zle kill-word
}
zle -N _change-first-word

_man-line() {
  LBUFFER="man $LBUFFER"
  zle accept-line
}
zle -N _man-line

_backward-kill-to-slash() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-kill-word
}
zle -N _backward-kill-to-slash

_fix-tilde-questionmark() {
  if [[ $LBUFFER[-1] == \~ ]]; then
    zle -U '/'
  else
    zle self-insert
  fi
}
zle -N _fix-tilde-questionmark

# widget keybinds --------------------------------------------

# builtins
bindkey "^?" backward-delete-char
bindkey "^J" backward-word
bindkey "^H" backward-kill-word
bindkey "^K" forward-word
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^U" backward-kill-line
bindkey "\e." insert-last-word
bindkey "\ee" edit-command-line
bindkey -M menuselect '^M' .accept-line
bindkey "^[[Z" reverse-menu-complete

# custom
bindkey -s '\eu' '^Ucd ..^M'
bindkey "\ea" _change-first-word
bindkey "\em" _man-line
bindkey "^W" _backward-kill-to-slash
bindkey "\?" _fix-tilde-questionmark

# vi mode status indicator -----------------------------------

zle-keymap-select() {
  zle reset-prompt
  zle -R
}
zle -N zle-keymap-select

MODE_INDICATOR="%B%F{yellow}-- INSERT --%k%b"

_vi_mode_prompt() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

if [ $TERM != "linux" ]; then
  RPROMPT='$(_vi_mode_prompt)'
fi

# prompt -----------------------------------------------------

_git_prompt() {
  local GIT_REF=${$(git symbolic-ref HEAD 2>/dev/null)#refs/heads/}
  if [ -z $GIT_REF ]; then
    GIT_REF=${$(git rev-parse HEAD 2>/dev/null)[1][1,7]}
  fi
  [ -z $GIT_REF ] && return
  echo "%k%b(%B%F{cyan}%20>..>${GIT_REF}%<<%k%b)"
}

if [ $TERM != "linux" ]; then
  GRUVBOX_PATH="$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
  [ -f $GRUVBOX_PATH ] && source $GRUVBOX_PATH
  unset GRUVBOX_PATH

  # syntax highlighting - should be sourced after all custom widgets have been created
  # (widgets created later will work, but will not update the syntax highlighting)
  HIGHLIGHTER_PATH="$HOME/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  [ -f $HIGHLIGHTER_PATH ] && source $HIGHLIGHTER_PATH
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
  PROMPT="%(1j.%B%F{green}(%j).)"     # background jobs
  PROMPT+="%(?..%B%F{red}(%?%))"      # exit code
  PROMPT+="%B%F{magenta}%50<..<%~%<<" # working directory
  PROMPT+='$(_git_prompt)'            # git
  PROMPT+="%b%f$ "
fi

# source -----------------------------------------------------

[ -f ~/.fzf.zsh ]        && source ~/.fzf.zsh
[ -f ~/shell_aliases ]   && source ~/shell_aliases
[ -f ~/shell_functions ] && source ~/shell_functions
[ -f ~/src/z/z.sh ]      && source ~/src/z/z.sh
