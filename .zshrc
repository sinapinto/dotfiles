[[ $- != *i* ]] && return 1

ZDOTDIR=${ZDOTDIR:-$HOME}

autoload -U colors && colors
eval `dircolors -b ~/.dir_colors`
. "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

_git_prompt() {
    ref=${$(git symbolic-ref HEAD 2>/dev/null)#refs/heads/} || return
    print -Pn '(%%{\e[36m%%}%20>..>$ref%<<%%{\e[00m%%})'
}

case $TERM in
    rxvt*|screen)
        setopt prompt_subst # parameter expansion in prompt
        # . $HOME/agnoster.zsh-theme # powerline prompt
        PROMPT='`[ $? -eq 0 ] || echo "%{$fg_bold[red]%}X "`'
        PROMPT+="%{$fg_bold[green]%}%30<..<%~%<<\$(_git_prompt) %{$reset_color%}%# "
        ;;
    linux) ;;
esac

zmodload -i zsh/complist
bindkey -M menuselect '^M' .accept-line

autoload -Uz compinit && compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' list-colors no=00 fi=00 di=01\;34 pi=33 so=01\;35 bd=00\;35 cd=00\;34 or=00\;41 mi=00\;45 ex=01\;32

setopt menu_complete # immediately select first menu item


change-first-word() {
  zle beginning-of-line -N
  zle kill-word
}
zle -N change-first-word
bindkey -M viins "\ea" change-first-word

backward-kill-to-slash() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-kill-word
}
zle -N backward-kill-to-slash
bindkey -M viins "^W" backward-kill-to-slash


bindkey -M viins ' ' magic-space
bindkey '^[[Z' reverse-menu-complete

bindkey "^J" backward-word
bindkey "^H" backward-kill-word
bindkey "^K" forward-word
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line


[ ! -f "$HOME/shell_aliases" ]   || . $HOME/shell_aliases
[ ! -f "$HOME/shell_functions" ] || . $HOME/shell_functions

unset TMUX
