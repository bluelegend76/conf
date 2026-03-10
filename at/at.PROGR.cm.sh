#!/usr/bin/env bash
# at.PROGR.cm.bash
# __

# TODO TODO TODO !!!!
#  = Extract Just Checklists for the Cb:s (=one list for each Lang|Area (!!!!))
# + extract and put links for/to the actual books/texts(!!!!) *****(!!!!)
# TODO TODO TODO !!!!

gvim -p \
    ~/SyncThing/rsc/data/lists/at/PROGR.cm.txt \
    ~/SyncThing/rsc/data/lists/ref/comp/lang/PROGRLANG.DB.ref.txt \
    -c 'set foldmethod=marker' \

    # ~/Dropbox/rsc/data/lists/ref/learn/courses/dbanasvids.txt \

gvim \
    ~/Dropbox/rsc/samples/code/Samples.langs.list.txt \
    -c 'set foldmethod=indent' \

