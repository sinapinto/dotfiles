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
  first_arg=$(echo $LBUFFER | cut -d ' ' -f1)
  LBUFFER="man $first_arg"
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

if [ -f ~/src/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/src/zsh-autosuggestions/zsh-autosuggestions.zsh
  bindkey '^ ' autosuggest-accept
fi

# prompt -----------------------------------------------------

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

_git_prompt() {
  local GIT_REF=${$(git symbolic-ref HEAD 2>/dev/null)#refs/heads/}
  if [ -z $GIT_REF ]; then
    GIT_REF=${$(git rev-parse HEAD 2>/dev/null)[1][1,7]}
  fi
  [ -z $GIT_REF ] && return
  echo "%k%F{cyan}(${GIT_REF}%k)"
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

  PROMPT="%B%50<..<%~%<<"
  PROMPT+='$(_git_prompt)'
  PROMPT+="%f > %b"
fi

# functions --------------------------------------------------

has() {
  command -v "$1" &> /dev/null
}

gco() {
  if [ $# -gt 0 ]; then
    git checkout "$@"
    return
  fi
  local branches branch
  branches=$(git branch | grep -v HEAD) &&
    branch=$(echo "$branches" |
  fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

d(){
  case $1 in
    i) dtach -A /tmp/weechat.dtach weechat ;;
    r) dtach -A /tmp/rtorrent.dtach rtorrent ;;
    z) dtach -A /tmp/zsh.dtach zsh ;;
    *) dtach -A /tmp/$1.dtach $1 ;;
  esac
}

touchpad(){
  local deviceid=$(xinput | grep TouchPad | cut -d "=" -f2| cut -f1)
  [ -z "$deviceid" ] && return 1
  val=$(xinput list-props "$deviceid" | grep able | tail -c 2)
  [ "$val" -eq 1 ] && xinput --disable "$deviceid" \
                   || xinput --enable "$deviceid"
}

# Escape potential tarbombs
# http://www.commandlinefu.com/commands/view/6824/escape-potential-tarbombs
etb() {
  l=$(tar tf $1);
  if [ $(echo "$l" | wc -l) -eq $(echo "$l" | grep $(echo "$l" | head -n1) | wc -l) ];
  then tar xf $1;
  else mkdir ${1%.t(ar.gz||ar.bz2||gz||bz||ar)} && tar xvf $1 -C ${1%.t(ar.gz||ar.bz2||gz||bz||ar)};
  fi ;
}

extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1;;
      *.tar.gz) tar xvzf $1;;
      *.bz2) bunzip2 $1;;
      *.gz) gunzip $1;;
      *.tar) tar xvf $1;;
      *.tbz2) tar xvjf $1;;
      *.tgz) tar xvzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *) echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# aliases ----------------------------------------------------

# make aliases work through sudo
alias sudo='sudo '

alias t='tmux attach || tmux new'
alias ls='ls -F --color=auto'
alias ll='ls -ahlF'
alias la='ls -FA'
alias a='la'
alias v='vim'
alias n='ncmpcpp'

# git
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gp='git push'
alias gl='git log --date=relative --graph --format="%C(blue)%h %C(yellow)%>(12)%ad %Cgreen%<(7)%aN%C(auto)%d %Creset%s"'
alias gd='git diff'

# pacman
if has pacman; then
  alias pacq='pacman -Q | grep'
  alias pacr='sudo pacman -Rsn'
  alias paci='sudo pacman -S'
  alias pacs='pacman -Ss'
  alias u='sudo pacman -Syu'
fi

# systemd
if has systemctl; then
  alias sc='systemctl'
  alias scu='systemctl --user'
  alias jc='journalctl'
  alias lc='loginctl'
  alias nc='netctl'
fi

# source -----------------------------------------------------

pgrep ssh-agent >/dev/null || eval "$(ssh-agent -s)"
source ~/src/z/z.sh
