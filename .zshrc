source $HOME/.bash_aliases
export PATH=$PATH:$HOME/bin

autoload -U colors && colors

eval `dircolors -b ~/.dir_colors`

R=$fg_bold[red]
G=$fg_bold[green]
M=$fg_no_bold[green]
Y=$fg_no_bold[yellow]
B=$fg_no_bold[blue]
C=$fg_no_bold[cyan]
RE=$reset_color
setopt prompt_subst
PROMPT='`[ $? -eq 0 ] && echo "%{$G%}%n in%{$RE%}%{$fg[green]%} %~ %{$Y%}❯%{$R%}❯%{$M%}❯ %{$RE%}" ||\
                         echo "%{$G%}%n in%{$RE%}%{$R%} %~ ❯❯❯ %{$RE%}"`'
source $HOME/.zsh_git_prompt

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

extract () {
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

cd(){ builtin cd $1 && ls --color=auto}
mu () { mupdf $1 & disown }
mp() { mpv $1 &>/dev/null & disown }
alias mpv='mp'

d(){ 
    case $1 in
        i) dtach -A /tmp/irssi.dtach irssi ;;
        r) dtach -A /tmp/rtorrent.dtach rtorrent ;;
        *) dtach -A /tmp/$1.dtach $1 ;;
    esac

}
touchpad(){
    local deviceid=$(xinput | grep TouchPad | cut -d "=" -f2| cut -f1)
    [ -z $deviceid ] && return 1
    val=$(xinput list-props $deviceid | grep able | tail -c 2)
    [ $(( ( $val + 1 ) % 2 )) -eq 0 ] && xinput --disable $deviceid \
                                      || xinput --enable $deviceid
}
asdf(){
    local file="$HOME/.playlist"
    [ -f $file ] || return 1
    [ -f "${file}.tmp" ] && rm -f "${file}.tmp" || echo "no temp file found"
    shuf -n $(wc -l $file | cut -d " " -f1) $file > "${file}.tmp"
    mpv --playlist="${file}.tmp"
}
r(){
    case $1 in
        1) mpv "http://radio.2f30.org:8000/live.ogg" ;;
        *) pkill -n mpv;;
    esac
}
swap(){
    mv $1 tmp.$1
    mv $2 $1
    mv tmp.$1 $2
}
sub(){
    if [[ -z "$1" ]]; then
        sublime & disown
    else
        sublime -n $@ &>/dev/null & disown
    fi
}

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[00;33m'
export LESS_TERMCAP_us=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'

bindkey "^J" backward-word
bindkey "^H" backward-kill-word
bindkey "^K" forward-word
