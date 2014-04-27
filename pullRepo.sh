#!/bin/bash
basedir=`pwd`
function update {
    target=$1
    branch=$2
    echo "Pulling $target"

    cd "$basedir/$target"
    git pull git@github.com:daboross/CloudBot.git $2:upstream $3
}
update Eliralin eliralin $1
update EliralinRefresh eliralin-refresh $1
