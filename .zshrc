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
export VISUAL="nvim"
export TERMINAL="st"

## Alias
alias \
    mpy='source $HOME/MyEnv/bin/activate' \
    mntsda4='sudo mount.ntfs-3g /dev/sda4 /mnt/' \
    xo='xdg-open' \
    ws='cd $HOME/Workspace/'

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
alias rm='rm -I'

# FZF setup

# Stuff to exlude
EXCLUDE="{.git,MyEnv,.local,.cache,.local,.npm,.nvim,.zprezto,.gradle,.config/chromium,go/pkg/mod,.wine,.themes,.cargo,.rustup}"

# Use fd for fuzzy file finding
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Function to search files using fd
fzf-file-widget() {
    local file
    file=$(fd --type f --hidden --follow --exclude "$EXCLUDE" | fzf)
    [ -n "$file" ] && xdg-open "$file"
}

# Function to change directory using fzf and fd
fzf-cd() {
    local dir
    dir=$(fd --type d --hidden --type directory --exclude "$EXCLUDE" | fzf)
    if [ -n "$dir" ]; then
        cd "$dir"
    fi
}

# Set up widgets
zle -N fzf-file-widget
zle -N fzf-cd

# Bind the widgets to keys
bindkey '^F' fzf-file-widget
bindkey '^G' fzf-cd

export PATH=$PATH:/home/veloXm/.rbenv/versions/3.3.5/bin
