#!/bin/bash
basedir=`pwd`
function update {
    cd "$basedir/$1"
    git fetch && git reset --hard "origin/${2}"
    cd ../
    git add "$1"
}
update CloudBot develop
update CloudBotRefresh slay-the-beast
