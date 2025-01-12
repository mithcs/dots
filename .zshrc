#
# Executes commands at the start of an interactive session.
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
export VISUAL="nvim"
export TERMINAL="st"

## Alias-es

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

# Git
alias \
    ga="git add" \
    gc="git commit" \
    gp="git push"

# Others
alias wireshark='sudo wireshark' \
    baobab='GSK_RENDERER=cairo baobab' \
    winetricks='GSK_RENDERER=cairo winetricks' \
    qml='/usr/lib/qt6/bin/qml' \
    cpc='xclip -selection clipboard' \
    pgres='sudo su - postgres' \
    rm='rm -I' \
    mpy='source $HOME/MyEnv/bin/activate' \
    mntsda4='sudo mount.ntfs-3g /dev/sda4 /mnt/' \
    xo='xdg-open' \
    ws='cd $HOME/Workspace/'

# Sass watcher
swatch() {
    if [[ $# -ne 2 ]]; then
        echo "Usage: swatch [input] [output]"
        return 1
    fi
    echo "Watching $1..."
    while true; do
        inotifywait "$1" -e close_write -qq
        sassc "$1" "$2" --style compressed
        echo "👍️"
    done
}

## FZF setup

# Stuff to exlude
EXCLUDE="{.git,MyEnv,.local,.cache,.local,.npm,.nvim,.zprezto,.gradle,.config,go/pkg/mod,.wine,.themes,.cargo,.rustup,.zen,.rbenv}"

# Use fd for fuzzy file finding
export FZF_DEFAULT_COMMAND='fd --type file --hidden --follow --exclude .git'

# Function to search files using fd
fzf-file-widget() {
    xdg-open $(fd --type file --hidden --follow --exclude "$EXCLUDE" | fzf)
}

# Function to change directory using fzf
fzf-cd() {
    cd $(fd --type d --hidden --type directory --exclude "$EXCLUDE" | fzf)
}

# Set up widgets
zle -N fzf-file-widget
zle -N fzf-cd

# Bind the widgets to keys
bindkey '^F' fzf-file-widget
bindkey '^G' fzf-cd

