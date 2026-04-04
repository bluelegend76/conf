#!/usr/bin/env bash
# at.muTeach.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/at/muTeach.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/mu/MU.COURSEPLAN.TEACH.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/mu/teori-sammanställning_musik.txt \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/mu/VARJEVECKAförgrupp_tonerlicksmm.txt \

