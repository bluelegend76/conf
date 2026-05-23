#!/usr/bin/env bash
# ref.funct-ml.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/cb/{clispcb,schemecb,clojure,haskell,sml-ocaml,fs}.txt

