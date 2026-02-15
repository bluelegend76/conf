#!/usr/bin/env bash
# at.Vim.sh

source "$HOME/repos/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/at/Vim.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/vim/Vim-Tocs.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/vim/vim_excommands-functions.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/vim/vimscrhardw-quickindex.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/vim/vim-patternregex.txt \

    ## =Include in ex|functs  ~/Dropbox/rsc/data/lists/ref/comp/vim-aucmdevents.txt
    # ~/Dropbox/rsc/data/lists/ref/comp/vimplugins.txt \


