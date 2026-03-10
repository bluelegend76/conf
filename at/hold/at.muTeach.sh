#!/usr/bin/env bash
# at.muTeach.bash

gvim -p \
    ~/SyncThing/rsc/data/lists/at/muTeach.txt \
    ~/SyncThing/rsc/data/lists/ref/mu/MU.COURSEPLAN.TEACH.txt \
    ~/SyncThing/rsc/data/lists/ref/mu/teori-sammanställning_musik.txt \
    ~/SyncThing/rsc/data/lists/ref/mu/VARJEVECKAförgrupp_tonerlicksmm.txt \
    -c 'tabdo set foldmethod=marker' \
    -c 'normal 1gt' \

