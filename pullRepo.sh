#!/bin/bash
basedir=`pwd`
function update {
    echo $1
    cd "$basedir/$1"
    git pull git@github.com:daboross/CloudBot.git $2:upstream $3
    cd ../
}
update Eliralin eliralin $1
update EliralinRefresh eliralin-refresh $1
