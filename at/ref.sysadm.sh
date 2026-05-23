#!/usr/bin/env bash
# ref.sysadm.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/{cb/bcb.index,sysadm/cmdl-fu.shell,cb/RegexCb,cb/regex-vim,cb/pshell}.txt

