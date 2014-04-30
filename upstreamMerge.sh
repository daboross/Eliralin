#!/bin/bash
basedir=`pwd`
function update {
    local what=$1
    local branch=$2
    cd "$basedir/$what"
    git checkout -B "$branch"
    git fetch && git reset --hard "origin/${2}"
    cd ../
    git add "$1"
}
update Refresh master
