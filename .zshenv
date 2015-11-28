export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME"
export GTK2_RC_FILES=/usr/share/themes/Vertex-Light/gtk-2.0/gtkrc
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.sock"
export VISUAL=vim
export EDITOR=$VISUAL
export BROWSER=chromium
export PAGER=less
export TERMINAL=rxvt-256color
export CC=gcc
# export REPORTTIME=5
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export HISTIGNORE="&:cd:m:l[af]:fg"
export LESS_TERMCAP_so=$(tput setaf 0; tput setab 3)
export LESS_TERMCAP_mb=$(printf "\e[01;31m")
export LESS_TERMCAP_md=$(printf "\e[00;33m")
export LESS_TERMCAP_us=$(printf "\e[01;31m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export DEFAULT_FZF_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export INFINALITY_FT_FILTER_PARAMS="00 33 34 33 00"
# export INFINALITY_FT_FILTER_PARAMS="04 20 38 20 04"
# export INFINALITY_FT_FILTER_PARAMS="06 22 36 22 06"
# export INFINALITY_FT_FILTER_PARAMS="10 25 37 25 10"
# export INFINALITY_FT_FILTER_PARAMS="12 28 42 28 12"
# export INFINALITY_FT_FILTER_PARAMS='15 35 40 35 15'
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=0
export INFINALITY_FT_GAMMA_CORRECTION='0 100'
export INFINALITY_FT_BRIGHTNESS=0
export INFINALITY_FT_CONTRAST=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=5
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=5
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=10
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=0
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
