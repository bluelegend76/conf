#!/bin/bash
# ~/bin/scripts/rsync-empire_dropbox-to-exthd1.bash
# TODO: Change name to Clouddirs(??)

read -p "You are about to copy Dropbox --> ext-hd1 (2022+)**. Proceed?: "
read -p "Sure?: "

sudo rsync -av --progress --delete /home/bluelegend/Dropbox/ /run/media/bluelegend/3a7592f8-41d6-4c29-b6d0-53533881b86a/Dropbox

# TODO(?): (NextCloud)
# +va-dirs(!!)

