#!/usr/bin/env bash
# ref.mmedia.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/{graf/pr/MultiMedia,comp/mu/MuRec}.txt

