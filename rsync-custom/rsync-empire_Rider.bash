#!/bin/bash
# ~/bin/scripts/rsync-empire_Rider.bash

read -p "You are about to copy Home-Rider --> ext-hd1 Rider: "
read -p "Only run if home/RiderProjects is Not Empty. Proceed?: "

# TODO Rename to JetbrainsSync
# + for all existing Home subdirs named '(Ullll)+Projects'
sudo rsync -av --progress --delete /home/bluelegend/RiderProjects/ /run/media/bluelegend/3a7592f8-41d6-4c29-b6d0-53533881b86a/Empire/rsc/code/RiderProjects
# I.e. rebake to Sync all active Jetbrains-projects folders

# +Possibly: If folder exists in Hd1 but not in Home, sync in reverse
# (+possibly with prompting)

