#!/bin/bash
basedir=`pwd`
function cleanPatches {
    local target="$1"
    cd "$basedir/$target-Patches"
    local -i NUM=1
    for NAME in *; do
        NAME_WITHOUT="${NAME:4}"
        OLD_NUM="${NAME::4}"
        NEW_NUM="$(printf "%04d" ${NUM})"
        NEW_NAME="${NEW_NUM}${NAME_WITHOUT}"
        if [[ "$NEW_NAME" != "$NAME" ]]; then
            echo "(${OLD_NUM} -> ${NEW_NUM})${NAME_WITHOUT}"
            mv "$NAME" "${NEW_NAME}"
        fi
        NUM="$((NUM + 1))"
    done
}
cleanPatches Refresh
