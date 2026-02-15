#!/usr/bin/env bash
# at.shorth.l.sh

source "$HOME/repos/at/utils/check-env.sh"

${EDITOR} \
    ${SYNCTHING_DIR}/rsc/data/lists/at/shorth.l.txt \
    # -c 'set foldmethod=marker' \

# TODO: CONVERT OUT TWO NEW STENOPAPER VERSIONS: BLUE / RED / GREEN / PURPLE LINES[!!]
# orig=~/Dropbox/rsc/tmpl/shorth/shorth-grayall1dom_20.tmpl.svg

# TODO TODO: IF SYSTEM IS DESKTOP:
#TODO TODO orig=~/Dropbox/rsc/tmpl/shorth/shorth-1dom-inverted_20.tmpl.svg
#TODO TODO dok=~/Dropbox/transcr/Shorth/shorth.transcr.svg
#TODO TODO cp ${orig} ${dok}
#TODO TODO inkscape ${dok} &
#TODO TODO gvim ${orig}
#
#TODO TODO inkscape ~/Dropbox/transcr/Shorth/transcr*.svg &
# done

# evince -l kontakt ~/Dropbox/rsc/Doks/Lang/Shorth/sv/rskrift.empire.pdf &          v+F9
# evince -l word ~/Empire/Doks/Lang/Shorth/en/stenogregg-dictionary.pdf &           v+F12
# evince -l 'they will' ~/Empire/Doks/Lang/Shorth/en/stenogregg-phrasebook.pdf &    v+S-F12

# # TODO: MERGE/KEEP WITH SHORTHAND
# gvim -p \
#     ~/Dropbox/rsc/data/lists/ref/shorth/rapidskr.txt \
#     ~/Dropbox/rsc/data/lists/ref/shorth/gregg.txt \
#     ~/Dropbox/rsc/data/lists/ref/shorth/rulesprincips.rskrift.txt \
#     -c 'vertical botright split ~/Dropbox/config/vim/short.sv.rskrift.snippets.vim' \
#     -c 'vertical botright split ~/Dropbox/config/vim/short.en.gregg.snippets.vim' \
#     -c 'vertical botright split ~/Dropbox/rsc/data/lists/ref/shorth/rulesprincips.gregg.short.txt' \

