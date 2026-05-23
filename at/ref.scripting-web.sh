#!/usr/bin/env bash
# ref.scripting-web.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/cb/{pycb,jscb,h5c3,jqcb,phpcb,luacb,elixir}.txt

