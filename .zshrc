[[ $- != *i* ]] && return 1

export PATH=$PATH:$HOME/bin

autoload -U colors && colors
if ! [[ `tty` =~ ^/dev/tty.* ]]; then
    eval `dircolors -b ~/.dir_colors`
fi

_git_prompt() {
    ref=${$(git symbolic-ref HEAD 2>/dev/null)#refs/heads/} || \
        ref=${$(git rev-parse HEAD 2>/dev/null)[1][1,7]} || \
        return
    print -Pn '%%{\e[00m%%}(%%{\e[01;36m%%}%20>..>$ref%<<%%{\e[00m%%})'
}

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

case $TERM in
    rxvt*|screen*|xterm*)
        source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

        # Base16 Shell
        # BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
        # [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

        source "$HOME/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

        setopt prompt_subst # parameter expansion in prompt
        # . $HOME/agnoster.zsh-theme # powerline prompt
        PROMPT='`[ $? -eq 0 ] || echo "%{$fg_bold[red]%}✘ "`'
        PROMPT+="%{$fg_bold[magenta]%}%50<..<%~%<<\$(_git_prompt)%{$reset_color%}$ "
        ;;
    linux) ;;
esac

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

#---------------------------------------------------------
change-first-word() {
    zle beginning-of-line
    zle kill-word
}
zle -N change-first-word
bindkey -M viins "\ea" change-first-word
#---------------------------------------------------------

#---------------------------------------------------------
vim-instead() {
    zle beginning-of-line
    zle kill-word
    LBUFFER="vim $LBUFFER"
    zle accept-line
}
zle -N vim-instead
bindkey -M viins "\ev" vim-instead
#---------------------------------------------------------

#---------------------------------------------------------
man-instead() {
    LBUFFER="man $LBUFFER"
    zle accept-line
}
zle -N man-instead
bindkey -M viins "\em" man-instead
#---------------------------------------------------------

#---------------------------------------------------------
backward-kill-to-slash() {
    local WORDCHARS="${WORDCHARS:s@/@}"
    zle backward-kill-word
}
zle -N backward-kill-to-slash
bindkey -M viins "^W" backward-kill-to-slash
#---------------------------------------------------------

#---------------------------------------------------------
tilde-questionmark() { # fix ~? to ~/
  if [[ $LBUFFER[-1] == \~ ]]; then
    zle -U '/'
  else
    zle self-insert
  fi
}
bindkey \? tilde-questionmark
zle -N tilde-questionmark
#---------------------------------------------------------

autoload edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line

bindkey -s "\eu" '^Ucd ..^M'
bindkey -s "\ef" '^J~/^E'
bindkey '\e.' insert-last-word

bindkey -M viins ' ' magic-space # expand stuff on spacebar
bindkey '^[[Z' reverse-menu-complete # shift-tab

[ ! -f "$HOME/shell_aliases" ]   || . $HOME/shell_aliases
[ ! -f "$HOME/shell_functions" ] || . $HOME/shell_functions

if [ "$TERM" = "linux" ]; then
  _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
  for i in $(sed -n "$_SEDCMD" $HOME/.Xdefaults | \
    awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
    echo -en "$i"
  done
  clear
fi
