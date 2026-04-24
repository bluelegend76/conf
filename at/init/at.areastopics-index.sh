#!/usr/bin/env bash
# at.areastopics-index.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/todo/areas-topics-todos.txt \
    ${SYNCTHING_DIR}/rsc/Doks/learn/ankidef22.vdeck.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/learnqna/vanki/DECK.MASTER.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/learnqna/vanki/DECK.dailies.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/at/learnmemo-qna.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/todo/econ-shoplist-acquisition-inköp.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/dft-thedoc_playlists-index.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/fstyle-christm.guit/fstyle-christm.mu.guit.pract.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.black/.list \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.blue/.list \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.green/.list \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.yellow/.list \
    -c 'colors darkblue' \

    # -c 'colors atom' \
    # -c 'colors bluedrake' \

#   ${SYNCTHING_DIR}/rsc/data/lists/todo/dualist.at.txt \
#   ${SYNCTHING_DIR}/rsc/data/lists/todo/AreasBig-restart2022.tmp.txt \

