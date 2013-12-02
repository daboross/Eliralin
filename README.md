Eliralin [![Build Status](https://travis-ci.org/daboross/Eliralin.png)](https://travis-ci.org/daboross/Eliralin)
===========

Eliralin patches for CloudBot.


How To
-----------

Init a CloudBot module : `git submodule update --init`

Apply Patches : `./applyPatches.sh`

### Create patch for eliralin ###

`cd Eliralin`

Add your file for commit : `git add <file>`

Commit : `git commit -m <msg>`

`cd ..`

Create Patch `./rebuildPatches.sh`
