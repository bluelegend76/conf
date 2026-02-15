#!/usr/bin/env bash
# at.contactsFriends.sh

source "$HOME/repos/at/utils/check-env.sh"

${EDITOR} \
    ${SYNCTHING_DIR}/rsc/data/lists/at/contactsFriends.txt \
    # -c 'set foldmethod=marker' \

