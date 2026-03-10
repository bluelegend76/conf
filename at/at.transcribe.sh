#!/usr/bin/env bash
# at.transcribe.bash

gvim -p \
    ~/SyncThing/rsc/data/lists/at/transcribe.txt \
    ~/Dropbox/bin/scripts/scri2pngdump.py \
    ~/dropbox-legacy/scripts/ALLTODOIST/zz_OCRPROC-OCRPROJ.bash \
    ~/Dropbox/bin/scripts/temp.bash \
    ~/dropbox-legacy/scripts/./GALAXYJPG2TXT_FLEX-norotation_notextcleaner.bash \
    ~/Dropbox/bin/scripts/pdf-toc2txt.bash \
    -c 'set foldmethod=marker' \

gvim \
    ~/SyncThing/rsc/data/lists/at/pdf.txt \
    -c 'set foldmethod=marker' \

