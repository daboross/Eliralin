#!/bin/bash
basedir=`pwd`
function update {
    local what=$1
    local branch=$2
    local remote_branch=$3
    cd "$basedir/$what"
    git checkout -B "$branch"
    git fetch && git reset --hard "${remote_branch}"
    cd ../
    git add "$what"
}
update Refresh master eliralin/event-changes
