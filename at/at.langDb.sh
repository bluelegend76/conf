#!/usr/bin/env bash
# at.langDb.sh

source "$HOME/repos/at/utils/check-env.sh"

# Todo 2023: read in viminfo(?) file with langdb-tags[!!]
${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/at/langDb.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/LangDb.txt \
    ${SYNCTHING_DIR}/scratch/langdoks-aux.samples.txt \
      ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/langdb.orig.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/dandict2mini.txt \
    -c 'normal 5gt' \

    # -c 'rviminfo ~/Dropbox/config/vim/langdb.empire.viminfo' \
    ## no 3: ~/Dropbox/rsc/data/lists/ref/lang/langdb-aux_freqlists.txt \

