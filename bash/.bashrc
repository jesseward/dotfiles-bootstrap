# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

# make dmesg output readable.
hdmesg () {
    $(type -P dmesg) "$@" | perl -w -e 'use strict;
        my ($uptime) = do { local @ARGV="/proc/uptime";<>}; ($uptime) = ($uptime =~ /^(\d+)\./);
        foreach my $line (<>) {
            printf( ($line=~/^\[\s*(\d+)\.\d+\](.+)/) ? ( "[%s]%s\n", scalar localtime(time - $uptime + $1), $2 ) : $line )
        }'
}

# enable gvm if present
if [ -f "${HOME}/.gvm/scripts/gvm" ] ;
then
    source ${HOME}/.gvm/scripts/gvm
fi

## bash prompt 
FULL_HOST=$(hostname -f)
PS1="${RS}\u${FWHT}@${RS}${FULL_HOST} ${HC}${FWHT}(${RS}${FBLE}\w${HC}${FWHT})\n(${RS}${FBLE}\@${HC}${FWHT}) >>>${RS} "

set -o vi

shopt -s autocd
shopt -s cmdhist histappend

alias tmux='TERM=xterm-256color tmux'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

export HISTTIMEFORMAT="%F %T "
export HISTFILESIZE=10000
export PS1

# load base16 colour schema
. ~/bin/base16-ocean.dark.sh
