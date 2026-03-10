#!/usr/bin/env bash
# at.muRecord.bash

gvim -p \
    ~/SyncThing/rsc/data/lists/at/muRecord.txt \
    ~/dropbox-legacy/mediaomusikinspelnlinux-ubuntustudiomm.txt \
    ~/dropbox-legacy/scripts/ALLTODOIST/mm_UBUNTUSTUDIO-MUSIKINSPELNINGLINUX.bash \
    -c 'tabdo set foldmethod=marker' \
    -c 'normal 1gt' \

