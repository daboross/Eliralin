#!/bin/bash

basedir=`pwd`
echo "Rebuilding patch files from current fork state..."
function cleanupPatches {
    cd "$1"
    for patch in *.patch; do
        gitver=$(tail -n 2 $patch | grep -ve "^$" | tail -n 1)
        diffs=$(git diff --staged $patch | grep -E "^(\+|\-)" | grep -Ev "(From [a-z0-9]{32,}|\-\-\- a|\+\+\+ b|.index)")

        testver=$(echo "$diffs" | tail -n 2 | grep -ve "^$" | tail -n 1 | grep "$gitver")
        if [ "x$testver" != "x" ]; then
            diffs=$(echo "$diffs" | head -n -2)
        fi

        if [ "x$diffs" == "x" ] ; then
            git reset HEAD $patch >/dev/null
            git add $patch
            git checkout -- $patch >/dev/null
        fi
    done
}

function savePatches {
    local what=$1
    local target=$2
    local branch=$3
    cd "$basedir/$target"
    git format-patch --no-stat -N -o "$basedir/${what}-Patches/" upstream/$branch
    cd "$basedir"
    git add -A
    git add "$basedir/${what}-Patches"
    cleanupPatches "$basedir/${what}-Patches"
    echo "  Patches saved for $what to $what-Patches/"
}

savePatches CloudBot Eliralin develop
savePatches CloudBotRefresh EliralinRefresh master
