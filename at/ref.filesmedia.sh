#!/usr/bin/env bash
# ref.filesmedia.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/{sysadm/browse/file,hardw/hardw-devices,sysadm/browse/media,sysadm/browse/web,sysadm/browse/mail,sysadm/browse/remote}.txt

