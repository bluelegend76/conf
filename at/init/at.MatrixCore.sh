#!/usr/bin/env bash
# at.areastopics-index.sh
# TODO: Perhaps add charAlfa to/at LangDoks

source "$HOME/conf/at/utils/check-env.sh"

# TODO: maybe add Slang to langs
${EDITOR} \
    ${SYNCTHING_DIR}/rsc/data/lists/todo/areas-topics-todos.txt \
    ${SYNCTHING_DIR}/rsc/scratch.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/at/contactsFriends.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/at/at.allm-a.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/at/jokeswit.soc.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/dft-thedoc_playlists-index.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/cmp.en.dict.en2sv-prsm.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/cmp.sv.dict.sv2en-prsm.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/sv.words.saol11-1991.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/sv.thes.svsyn.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/En-IdiomDict.txt
    ${SYNCTHING_DIR}/rsc/data/lists/at/Litt-poetry.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/Quotes.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/todo/econ-shoplist-acquisition-inköp.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/todo/weblinks-resources-doks.txt \
    ${SYNCTHING_DIR}/rsc/Doks/learn/ankidef22.vdeck.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/learnqna/vanki/DECK.MASTER.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/learnqna/vanki/DECK.dailies.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/at/learnmemo-qna.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/at/Jur.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/fstyle-christm.guit/fstyle-christm.mu.guit.pract.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.black/.list \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.blue/.list \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.green/.list \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.yellow/.list \
    ${SYNCTHING_DIR}/rsc/data/lists/at/mu.genresListening2.txt \
    ${SYNCTHING_DIR}/rsc/Doks/publish/fvkun/a.vamp-necr-mag.txt \
    ${SYNCTHING_DIR}/rsc/Doks/publish/fvkun/vampireskiss-lostblog.legacy.txt \
    ${SYNCTHING_DIR}/rsc/Doks/publish/fvkun/01_TrinitySuite.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/at/sysadm.Lin.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/at/PROGR.cm.txt \
    -c 'colors retrobox' \

#   -c 'colors darkblue' \
    # -c 'colors atom' \
    # -c 'colors bluedrake' \

#   ${SYNCTHING_DIR}/rsc/data/lists/todo/dualist.at.txt \
#   ${SYNCTHING_DIR}/rsc/data/lists/todo/AreasBig-restart2022.tmp.txt \

