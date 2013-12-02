#!/bin/bash
basedir=`pwd`
function update {
    echo $1
    cd "$basedir/$1"
    git pull git@github.com:daboross/CloudBot.git $2:upstream
    cd ../
}
update Eliralin eliralin
