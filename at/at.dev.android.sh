#!/usr/bin/env bash
# at.dev.android.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} \
    ${SYNCTHING_DIR}/rsc/data/lists/at/dev.android.txt \
    -c 'set foldmethod=marker' \

