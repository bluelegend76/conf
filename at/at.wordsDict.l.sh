#!/usr/bin/env bash
# at.wordsDict.l.sh

source "$HOME/conf/at/utils/check-env.sh"

# TODO TODO: CREATE 4-5 TABS WITH VERT-SPLITS FOR 'DUALS'(sv-thes, en-sv etc)
# TODO tabs on desktop
# TODO buffers in Termux
${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/sv.words.saol11-1991.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/cmp.en.dict.en2sv-prsm.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/theinstantintell-words.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/en.thes.xf.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/en.words.wnwdict.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/beving.txt \
    ${SYNCTHING_DIR}/rsc/Doks/Lang/Sv/svenska_idiomatiska_uttryck.txt \
    ${SYNCTHING_DIR}/rsc/Doks/Lang/En/En-IdiomDict.txt \
    ${SYNCTHING_DIR}/rsc/Doks/Lang/Sv/ordsprsvgreen.txt \
    ${SYNCTHING_DIR}/rsc/Doks/Lang/Sv/citat_littlered.txt \
    ${SYNCTHING_DIR}/rsc/Doks/Lang/Sv/gulacitatbok-tidens.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/slangordb.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/at/wordsDict.l.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/at/jokeswit.soc.txt \
    -c 'normal gt' \
    -c 'botright split ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/sv.thes.svsyn.txt' \
    -c 'normal gt' \
    -c 'botright split ${SYNCTHING_DIR}/rsc/data/lists/ref/lang/cmp.sv.dict.sv2en-prsm.txt' \
    -c 'normal 11gt' \
    -c 'botright split ${SYNCTHING_DIR}/rsc/Doks/Lang/Sv/gulacitatbok-tidens.txt' \
    -c 'normal 1gt' \


    ## ~/Empire/Doks/Lang/Sv/svenskaord_favoriter \

#   ~/Dropbox/rsc/Doks/allm-a/soc/jokes/jokesretortswit.txt \

