#!/usr/bin/env bash
# ref.git-testdeploy.sh

source "$HOME/conf/at/utils/check-env.sh"

${EDITOR} -p \
    ${SYNCTHING_DIR}/rsc/data/lists/ref/comp/cb/{git,compile-build,Testing,deploy-devops,math-progr,algos,probltask-leetrosetta,disassembly}.txt

