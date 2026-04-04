#!/usr/bin/env bash
# ~/bin/scripts/rsync-empire_exthd1Mu-to-Music.bash

read -p "You are about to copy ext-hd1 Music --> home/Music. Proceed?: "
read -p "Sure?: "

sudo rsync -av --progress --delete /run/media/bluelegend/3a7592f8-41d6-4c29-b6d0-53533881b86a/Empire/Music/ /home/bluelegend/Music

