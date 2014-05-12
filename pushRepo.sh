#!/bin/bash
basedir=`pwd`
function update {
    local target=$1
    local branch=$2
    local upstream_branch=$3

    echo "Pushing $target"

    cd "$basedir/$target"
    git push git@github.com:daboross/EliRefresh.git $branch:$upstream_branch -f
}
update Eliralin master master
