#!/usr/bin/env bash
# ref.markup-office.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/cb/{moffice,loffice,latexcb}.txt

