#!/usr/bin/env bash
# at.Gimp.g.bash

gvim -p \
    ~/SyncThing/rsc/data/lists/at/Gimp.g.txt \
    ~/dropbox-legacy/scripts/ALLTODOIST/GIMP.bash \
    -c 'tabdo set foldmethod=marker' \
    -c 'normal 1gt' \

