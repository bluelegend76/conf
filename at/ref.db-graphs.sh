#!/usr/bin/env bash
# ref.db-graphs.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/cb/{Db.sql,db.graph,db.nosql}.txt

