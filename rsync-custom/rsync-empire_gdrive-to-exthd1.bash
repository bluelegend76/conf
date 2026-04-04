#!/bin/bash
# ~/bin/scripts/rsync-empire_gdrive-to-exthd1.bash

read -p "You are about to copy gdrive --> ext-hd1 (2022+)**. Proceed?: "
read -p "Sure?: "

sudo rsync -av --progress --delete /home/bluelegend/gdrive/ /run/media/bluelegend/3a7592f8-41d6-4c29-b6d0-53533881b86a/gdrive

