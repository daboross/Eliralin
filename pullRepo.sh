#!/bin/bash
basedir=`pwd`
function update {
    local target=$1
    local branch=$2
    local upstream_branch=$3

    echo "Pulling $target"

    cd "$basedir/$target"
    git pull git@github.com:daboross/CloudBot.git $upstream_branch:$branch "${@:4}"
}
update Eliralin eliralin develop "$@"
update EliralinRefresh eliralin-refresh master "$@"
