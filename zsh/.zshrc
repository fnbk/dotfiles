#
# $PATH
#

export PATH=''
export PATH=/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/bin:$PATH

# npm
export PATH=/usr/local/share/npm/bin:$PATH

# go
export PATH=/usr/local/go/bin:$PATH

# kafka
export PATH=/usr/local/kafka/bin:$PATH

# homebrew
export PATH=/opt/homebrew/bin:$PATH

# macports
export PATH=/opt/macports/bin:$PATH

# chef
export PATH=/opt/chef/embedded/bin:$PATH

#
# $GOPATH
#

export GOPATH=$HOME/go

#
# compiler flags
#

#export DYLD_LIBRARY_PATH=/usr/local/lib
#export CFLAGS="-I/usr/local/include"
#export LDFLAGS="-L/usr/local/lib"

#
# language settings: # echo $(locale)
#

export LC_ALL=C
export LANG=en_US.UTF-8

#
# vcprompt: http://git.io/SgWFtw
#

autoload -U colors && colors
local username=${1:-$fg[orange]}
local branch=${2:-$fg[green]}
local changes=${3:-$fg[red]}
export VCPROMPT_FORMAT=" ± (%b${changes}%m%u${branch})"
PROMPT="%{%B$username%}%n%{$reset_color%}:%~%{%B$branch%}\$(vcprompt)%{$reset_color%b%}
-> "

# # don't autocorrect ack (whitelisting)
# alias ack='nocorrect ack'
#
# add color to pager
# export LESS=-RFX

#
# docker
#

# export docker ip address
$(boot2docker shellinit)


# show docker ip address (boot2docker)
docker-ip() {
  boot2docker ip 2> /dev/null
}

# nsenter: https://github.com/jpetazzo/nsenter
docker-enter() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  boot2docker ssh -t sudo /var/lib/boot2docker/docker-enter "$@"
}

# remove untagged images
docker-remove-images() {
  docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
}

# remove stopped containers
docker-remove-containers() {
  docker rm $(docker ps -a -q)
}

#
# default editor
#

export EDITOR=vim

#
# vi mode
#

bindkey -v

#
# history
#

# use incremental search
bindkey "^R" history-incremental-search-backward

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# bindkey "^F" vi-cmd-mode
# bindkey jj vi-cmd-mode

# add some readline keys back
# bindkey "^A" beginning-of-line
# bindkey "^E" end-of-line

# handy keybindings
# bindkey "^P" history-search-backward
# bindkey "^Y" accept-and-hold
# bindkey "^N" insert-last-word
# bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"
# look for ey config in project dirs

#
# zsh shell options
#

# source: http://zsh.sourceforge.net/Doc/Release/zsh.html
# man zshoptions # list zshell options

# expand functions in the prompt
setopt prompt_subst

# automatically enter directories without cd
setopt auto_cd

# # automatically pushd
# setopt auto_pushd
# export dirstacksize=5

# # awesome cd movements from zshkit
# setopt AUTOCD
# setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
# setopt cdablevars
#
# # Try to correct command line spelling
# setopt CORRECT CORRECT_ALL
#
# # Enable extended globbing
# setopt EXTENDED_GLOB


#
# aliases
#

# password generator
alias password='pwgen --algorithm=memorable --count=1 --length=12'

# vi
alias vi='mvim'

# Unix
alias ln='ln -v'
alias mkdir='mkdir -p'

alias l='ls'
alias ll='ls -al'

# git
alias g="git"
alias gs="git status -sb"
alias gd="git difftool -y -t Kaleidoscope"

# uuid: 8a7fbe10-99c0-444b-b9b6-9ee723ecff0d
alias uuid='uuidgen | tr 'A-Z' 'a-z''
