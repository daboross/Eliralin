#!/bin/bash
basedir=`pwd`
function update {
    cd "$basedir/$1"
    git fetch && git reset --hard origin/develop
    cd ../
    git add $1
}
update CloudBot
