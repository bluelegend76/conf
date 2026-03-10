#!/bin/bash
# ~/bin/scripts/rsync-empire_drswin.bash

read -p "You are about to copy drswin10 --> ext-hd1. Proceed?: "
read -p "Sure?: "

sudo rsync -av --progress --delete /media/bluelegend/328668208667E339/Users/bluelegend/Desktop/drswin/ /media/bluelegend/3a7592f8-41d6-4c29-b6d0-53533881b86a/drswin
# sudo rsync -vz --status=progress /media/bluelegend/328668208667E339/Users/bluelegend/_vimrc /media/bluelegend/3a7592f8-41d6-4c29-b6d0-53533881b86a/drswin/

# /var/www/public_html/.htaccess root@<remote-ip>:/var/www/public_html/

