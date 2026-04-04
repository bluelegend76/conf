#!/usr/bin/env bash
# at.contactsFriends.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} \
    ${SYNCTHING_DIR}/rsc/data/lists/at/contactsFriends.txt \
    # -c 'set foldmethod=marker' \

