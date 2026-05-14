#!/usr/bin/env bash
# at.allm-a.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} \
    ${SYNCTHING_DIR}/rsc/data/lists/at/arrCompose.txt \
    -c 'tabdo set foldmethod=marker' \

    # -c 'tabdo set nowrap' \
    # -c 'norm 1gt' \
    # -c 'setlocal wrap' \

