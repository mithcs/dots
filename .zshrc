# Executes commands at the start of an interactive session.
#
# Inspired by:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

## Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

## Prevent execution of certain commands over ssh
if [ -n "$SSH_CONNECTION" ]; then
    alias rm="echo 'Execution of rm is disabled: '"
    alias chmod="echo 'Execution of chmod is disabled: '"
    
    echo "SSH connection is successful"
    fastfetch
fi

## Default Programs
export EDITOR="nvim"
export TERMINAL="alacritty"
export VISUAL="nvim"

## Alias
alias \
    mpy='source $HOME/MyEnv/bin/activate' \
    mntsda4='sudo mount.ntfs-3g /dev/sda4 /mnt/' \
    xo='xdg-open' \
    nn='$HOME/zzz/openNeovim.sh' \
    ws='cd $HOME/Workspace/' \
    nm='neomutt'

# Verbosity
alias \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vI"

# Colorize
alias \
    ls="ls -hN --color=auto --group-directories-first" \
    grep="grep --color=auto" \
    diff="diff --color=auto"

# Others
alias wireshark='sudo wireshark'
alias baobab='GSK_RENDERER=cairo baobab'
alias winetricks='GSK_RENDERER=cairo winetricks'
alias qml='/usr/lib/qt6/bin/qml'
alias cpc='xclip -selection clipboard'
alias pgres='sudo su - postgres'

# FZF setup

# Stuff to exlude
EXCLUDE="{MyEnv,.local,.cache,.local,.npm,.nvim,.zprezto,.gradle,.config/chromium,go/pkg/mod,.wine,.themes,.cargo,.rustup,/.git}"

# Use fd for fuzzy file finding
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'


# Enable fuzzy history search
fzf-history-widget() {
    local selected
    selected=$(fc -l -n -r | fzf)
    if [ -n "$selected" ]; then
        READLINE_LINE="$selected"
        READLINE_POINT=${#READLINE_LINE}
    fi
}

# Function to search files using fd
fzf-file-widget() {
    local file
    file=$(fd --type f --hidden --follow --exclude "$EXCLUDE" | fzf)
    [ -n "$file" ] && nvim "$file"
}

# Function to change directory using fzf and fd
# There is a issue somewhere so we have to press enter twice
fzf-cd() {
    local dir
    dir=$(fd --type d --hidden --type directory --exclude "$EXCLUDE" | fzf)
    if [ -n "$dir" ]; then
        cd "$dir"
    fi
}

# Set up widgets
zle -N fzf-history-widget
zle -N fzf-file-widget
zle -N fzf-cd

# Bind the widgets to keys
bindkey '^F' fzf-file-widget
bindkey '^R' fzf-history-widget
bindkey '^G' fzf-cd

# Others
# Flutter setup
# export ANDROID_HOME=/opt/android-sdk
# export FLUTTER=/opt/flutter/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools:$FLUTTER
