#!/bin/bash
basedir=`pwd`
function update {
    local target=$1
    local branch=$2

    echo "Pushing $target"
    cd "$basedir/$target"
    git push git@github.com:daboross/CloudBot.git upstream:$2 -f
    cd ../
}
update Eliralin eliralin
update EliralinRefresh eliralin-refresh
