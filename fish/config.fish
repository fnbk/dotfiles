#
# yarn
#

set -g -x PATH $PATH (yarn global bin)

#
# go
#

set -g -x GOROOT /usr/local/Cellar/go@1.9/1.9.6/libexec/
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

# python
alias p2='/usr/local/bin/python2'
alias p3='/usr/local/bin/python3'

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

