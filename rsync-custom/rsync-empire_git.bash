#!/bin/bash
# ~/bin/scripts/rsync-empire.bash

read -p "You are about to copy git local --> hd1 git. Proceed?: "
read -p "Is your local git synced/Existing?(!!): "

sudo rsync -av --progress --delete /home/bluelegend/git/ /run/media/bluelegend/3a7592f8-41d6-4c29-b6d0-53533881b86a/Empire/rsc/code/git/

