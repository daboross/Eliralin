#!/bin/bash

basedir=`pwd`
echo "Rebuilding Forked projects.... "

function applyPatch {
    local what=$1
    local target=$2
    local branch=$3

    cd "$basedir/$what"

    git checkout -B $branch #> /dev/null

    cd "$basedir"

    if [[ ! -d  "$basedir/$target" ]]; then
        git clone $1 $target -b $branch -o upstream
    fi

    cd "$basedir/$target"

    echo "Resetting $target to $what..."
    git checkout $branch &> /dev/null
    git fetch upstream &> /dev/null
    git reset --hard upstream/$branch

    echo "  Applying patches to $target..."
    git am --abort
    git am --3way "$basedir/${what}-Patches/"*.patch
    if [ "$?" != "0" ]; then
        echo "  Something did not apply cleanly to $target."
        echo "  Please review above details and finish the apply then"
        echo "  save the changes with rebuildPatches.sh"
        return 1
    else
        echo "  Patches applied cleanly to $target"
    fi
}

applyPatch CloudBot Eliralin develop
applyPatch CloudBotRefresh EliralinRefresh master
