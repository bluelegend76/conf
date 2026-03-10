#!/usr/bin/env bash
# at.Inkscape.g.bash

gvim -p \
    ~/SyncThing/rsc/data/lists/at/Inkscape.g.txt \
    ~/dropbox-legacy/scripts/ALLTODOIST/INKSCAPE.bash \
    -c 'tabdo set foldmethod=marker' \
    -c 'normal 1gt' \

