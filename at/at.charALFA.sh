#!/usr/bin/env bash
# at.charALFA.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/at/charALFA.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/charalpha.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/charalpha.txt \
    -c 'colorscheme slate' \
    -c 'set guifont=Monospace\ Regular\ 15' \
    -c 'echom "Testing setting font-size"' \

