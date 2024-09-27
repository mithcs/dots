#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
    adb='$HOME/Downloads/android-tools/platform-tools/adb' \
    gtk='cat $HOME/projects/token.txt | xclip -selection clipboard' \
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
alias qml='/usr/lib/qt6/bin/qml'
alias cpc='xclip -selection clipboard'
alias pgres='sudo su - postgres'
