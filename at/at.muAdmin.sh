#!/usr/bin/env bash
# at.muAdmin.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/at/muAdmin.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/dft-thedoc_playlists-index.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.black/.list \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.blue/.list \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.green/.list \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.yellow/.list \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/fstyle-christm.guit/fstyle-christm.mu.guit.pract.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/mu/i.guitar/ac/dftproj/.fun/.list \
    -c 'normal gt' \
    -c 'botright split ${SYNCTHING_DIR}/rsc/data/lists/ref/mu/TheDoc-Fingerstyle_Arrs.txt' \
    -c 'normal 1gt' \

#   -c 'colors atom' \
#   -c 'set guifont=Monospace\ Regular\ 12' \

# TODO If system is desktop:
#   thunar ~/Empire/rsc/media/PerformArrCompose/ &
#

# ~/dropbox-legacy/scripts/ALLTODOIST/./drsdfsmm_spelninglåtlistor-mellansnshowm.bash

