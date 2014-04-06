#!/bin/bash
basedir=`pwd`
function update {
    echo $1
    cd "$basedir/$1"
    git push git@github.com:daboross/CloudBot.git upstream:$2 -f
    cd ../
}
update Eliralin eliralin
update EliralinRefresh eliralin-refresh
