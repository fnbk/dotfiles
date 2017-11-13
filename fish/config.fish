#
# PATH variable
#

# prepend to PATH variable: set PATH /usr/local/bin $PATH
# prepend to PATH using fish universal variable: set -U fish_user_paths /usr/local/bin $fish_user_paths
# source: http://bit.ly/2z3rzlQ

set -g fish_user_paths "/usr/local/opt/go@1.8/bin" $fish_user_paths


#
# go
#

set -g -x GOROOT /usr/local/Cellar/go@1.8/1.8.4/libexec/
set -g -x GOPATH ~/primary/go
set -g -x PATH $PATH $GOROOT/bin # go root binaries
set -g -x PATH $PATH ~/primary/go/bin # go path binaries


#
# handy alisases
#

# git
alias gs="git status"
alias gd="git diff"

# go
alias gt='go test (go list ./... | grep -v vendor)'

#
# zookeeper & kafka
#

alias start_zookeeper='zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties'
alias stop_zookeeper='zookeeper-server-stop'

alias start_kafka='kafka-server-start /usr/local/etc/kafka/server.properties'
alias stop_kafka='kafka-server-stop'

#
# ActiveMQ
#

alias start_activemq='activemq start'
alias stop_activemq='activemq stop'

#
# custom project settings
#

source ~/.config/fish/primary.fish
source ~/.config/fish/pim.fish
source ~/.config/fish/high-value-team.fish

