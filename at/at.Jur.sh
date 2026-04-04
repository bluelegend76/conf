#!/usr/bin/env bash
# at.soc.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/at/Jur.txt \
    ${SYNCTHING_DIR}/rsc/Doks/allm-a/Jur/JurVard-Def.txt \
    # -c 'set foldmethod=marker' \

