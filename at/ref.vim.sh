#!/usr/bin/env bash
# ref.vim.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/at/Vim.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/vim/Vim-Tocs.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/vim/vim_excommands-functions.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/vim/vimscrhardw-quickindex.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/vim/vim-patternregex.txt \

