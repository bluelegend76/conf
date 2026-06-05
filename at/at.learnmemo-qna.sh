#!/usr/bin/env bash
# at.learnmemo-qna.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/at/learnmemo-qna.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/learnqna/learningareas-tagstree_wanki.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/learnqna/vanki/DECK.dailies.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/learnqna/vanki/DECK.MASTER.txt \
    ${SYNCTHING_DIR}/rsc/Doks/learn/ankidef22.vdeck.txt \
    ${SYNCTHING_DIR}/rsc/Doks/learn/ankiman2021plus.Tags1.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/dokid-shortcodes.txt \
    ${SYNCTHING_DIR}/rsc/phonedoks-lgc/inits/init.vt-termux.vim \

    # -c 'normal 1gt' \
    # -c 'lcd %:h' \

#   ~/Dropbox/rsc/data/lists/learnqna/vanki/decks/DECK.MASTER.txt \
#   ~/Dropbox/rsc/data/lists/learnqna/vanki/decks/learn/ankidef22.vdeck.txt \
        ## ~/SyncThing/rsc/data/lists/learnqna/vanki/ankidef22.vdeck.txt

