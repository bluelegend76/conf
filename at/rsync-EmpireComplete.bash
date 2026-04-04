#!/usr/bin/env bash
# ~/conf/rsync/rsync-empire_dropbox-to-exthds.bash
# Wrapper-script to run Complete EmpireFleet-Sync

#  rsync 'curr. Videos' to device (!! (****))
  #  Musik-Projektet (=linkfolders for all the different moods) + (playlists with the different moods)  **(**)

# TODO: ADD CHECKS FOR WHAT IS MOUNTED[!!]
# Ubuntu: /media/{username}
# Arch: /run/media/{username}
read -p "About to run syncing (via rsync). Press Enter to continue: "
read -p "(Make sure the two external USB-drives are connected, then press Enter): "
rsync-empire_syncthing-to-exthd1.sh
# TODO: ADD SYNCING FOR GIT-MANAGED 'CONF' AND 'REPOS' [**]
sudo rsync -av --progress --delete /home/bluelegend/conf/ /run/media/bluelegend/3a7592f8-41d6-4c29-b6d0-53533881b86a/conf
# TODO: Activate after having downloaded all relevant repos
# FIXME: May want to check and update (back to USB-disk)
#        only the repos that have been downloaded
# sudo rsync -av --progress --delete /home/bluelegend/conf/ /run/media/bluelegend/3a7592f8-41d6-4c29-b6d0-53533881b86a/repos
rsync-empire_dropbox-to-exthd1.sh
# TODO=REACTIVATE rsync-empire_gdrive-to-exthd1.bash
rsync-empire_exthd1Mu-to-Music.sh
rsync-empire_exthd1-to-exthd2seccop.sh
# --
audacious ~/Dropbox/rsc/media/au/sfx/ding.sfx.mp3 &

