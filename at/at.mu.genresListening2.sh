#!/usr/bin/env bash
# at.mu.genresListening2.sh

source "$HOME/repos/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/at/mu.genresListening2.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/music.empire.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/mu/ost-awards.list.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/at/Lyrics.litt.txt \
    # -c 'set foldmethod=marker' \

#   ${SYNCTHING_DIR}/rsc/data/lists/at/Litt-poetry.txt \

