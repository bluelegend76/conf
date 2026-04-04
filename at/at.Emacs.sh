#!/usr/bin/env bash
# at.Emacs.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/at/Emacs.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/emacs/elisp_refman.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/emacs/emacs-mastextend.check.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/emacs/Em1-notes_x2.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/emacs/orgman-emacs.index.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/emacs/emacs-dired.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/emacs/emacsman1.index.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/emacs/emacsrefcard-org.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/emacs/emacsrefcard-shortessential.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/editor/emacs/emacsrefcard-Long.txt \
    -c 'set foldmethod=marker' \

