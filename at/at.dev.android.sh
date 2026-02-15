#!/usr/bin/env bash
# at.dev.android.sh

source "$HOME/repos/at/utils/check-env.sh"

${EDITOR} \
    ${SYNCTHING_DIR}/rsc/data/lists/at/dev.android.txt \
    -c 'set foldmethod=marker' \

