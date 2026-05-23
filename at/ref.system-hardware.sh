#!/usr/bin/env bash
# ref.system-hardware.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/cb/{asm,cppcb,dlangcb,rustcb,jcb,cscb,go-v}.txt

