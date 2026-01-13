# vim:fdm=marker:
# TODO ____
# sudo pacman -S hugo
# sudo pacman -S tcc
# extra/entr 5.7-1 - Run arbitrary commands when files change
# ghidra - reverse-engineering framework
# yay -S visual-studio-code-bin
# ========================================================
# ---------------- "Let There be ..."  -------------------
# ========================================================
#
#                   /#\
#                  /###\      
#                 /#####\              #   
#                /##.-.##\    #%" a#"e 6##%
#               /##(   )##\   #   #    #  #
#              /##.~   ~.##\  #   %#e" #  #
#             /.^         ^.\ 

# https://wiki.archlinux.org/title/Arch_build_system

# Main/Daily updating via Pacman/Yay:
# sudo pacman -Syu; yay -Syu
# --
# Format external drive to ExFat (Lin/Win/Mac compatability):
# sudo pacman -S exfat-utils
# sudo mkfs.exfat /dev/sdb1

# TODO TODO: Set System-lang to En-Us
# Set keyboard-layout to Se+Dvorak (==Svorak)

git clone https://github.com/bluelegend76/conf.git ~/conf/
mkdir ~/repos/
git clone https://github.com/bluelegend76/at.git ~/repos/at/
git clone https://github.com/bluelegend76/vtouch-vanki.git ~/repos/vtouch-vanki/
git clone https://github.com/bluelegend76/utils.git ~/repos/utils/

sudo pacman -S firefox torbrowser-launcher

# ln -s ~/Dropbox/config/fluxbox/startup ~/.fluxbox/startup

echo "Installing Vims + linking up vim settings: ..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo pacman -S gvim neovim neovide
echo "Now linking up vimrc..."
ln -s ~/conf/.vimrc ~/.vimrc
clear
read -p "Do a ':PluginInstall' in gvim, then press 'Enter' here to continue: "
# sudo apt-get install neovim-qt neovide
# rm -f ~/.vim/{colors,plugin,spell}/
ln -s ~/conf/vim/colors ~/.vim/colors
ln -s ~/conf/vim/plugin ~/.vim/plugin
ln -s ~/conf/vim/spell ~/.vim/spell
sudo pacman -S translate-shell

echo "Now linking up bashrc, inputrc: ..."
rm -f ~/.bashrc ~/.inputrc ~/.profile
ln -s ~/conf/.bashrc ~/.bashrc
ln -s ~/conf/.inputrc ~/.inputrc
ln -s ~/conf/.profile ~/.profile
# For Keyb3: Alt-gr + Lessthan/GreaterThan
## ln -s ~/Dropbox/config/keymap/.keyb3_altgr-lessgreater.xmodmap
ln -s ~/repos/scripts/ ~/.local/bin/scripts/
find ~/repos/scripts/ -maxdepth 1 -type f -exec ln -s "{}" ~/.local/bin/ \;

sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

sudo pacman -S \
    noto-fonts \
    noto-fonts-cjk \
    && fc-cache -fv

cd
yay -Syu dropbox
dropbox start
dropbox start &

mkdir ~/gdrive/
# TODO: SET FOR MANUAL DOWNLOAD(!!)
yay -S insync
#@@__ read -p "Next: Downloading Insync [22.04] (with info 'trulystrange' and 'i0...'): "
#@@__ echo "(Slight pause +) Starting Insync: ..."
#@@__ sleep 8
#@@__ insync start

sudo pacman -S syncthing

EXTHD1='3a7592f8-41d6-4c29-b6d0-53533881b86a'
read -p "[Pre 0] Current ExtHd 1 set to ${EXTHD1}. Exit and modify if this setup has changed[!]: "
read -p "[Pre 1/3] Start off with a done Dropbox and Fluxbox install. Ready?: "
read -p "[Pre 2/3] The two Main(=Ext Hds) should be hooked up and Mounted?: Done?: "
read -p "[Pre 3/3] You should be positioned in the Home Folder. Clear?: "
read -p "Start?: "

echo "Creating and linking up some directories: ..."
ln -s ~/Dropbox/bin/ ~/
mkdir -p ~/processdir/{compile,rds}/
clear
read -p "Connect and mount External Main HDDrive 1(!), then Press Enter: "
ln -s /run/media/bluelegend/${EXTHD1}/legacy/dropboxlegacy_pre2021/ dropbox-legacy
ln -s /run/media/bluelegend/${EXTHD1}/Empire/
ln -s /run/media/bluelegend/${EXTHD1}/legacy/
ln -s /run/media/bluelegend/${EXTHD1}/SyncThing

sudo pacman -S keepassxc

echo "Now linking up emacs inits: ..."
# If using next line: Add gitignore (for Emacs system-dirs) to Git-repo
ln -s ~/conf/.emacs.d/ ~/.emacs.d/
sudo pacman -S emacs
# emacs-wayland

sudo pacman -S blueman

sudo pacman -S gnome-clocks

# Updating pacman mirror-lists
sudo pacman -S reflector

echo "Installing some Git-tools ... "
sudo pacman -S github-cli meld diffuse
# git-gui

clear
echo "Installing some utilities (curl, rename, tree, ag/agrep, scrot, tesseract): ..."
sudo pacman -S man-db man-pages
# sudo mandb
sudo pacman -S scrot tree
## pacman -S curl
sudo pacman -S rsync
# yq = yaml, toml  (= 'Manually writing Json')
sudo pacman -S jq yq
sudo pacman -S bash-completion
sudo pacman -S mc
sudo pacman -S cmake cgdb
# umbrello
sudo pacman -S renameutils
#acpi rar
sudo pacman -S unrar
sudo pacman -S unzip # zip
sudo pacman -S tre
  # i.e. includes agrep
sudo pacman -S ripgrep-all  # rg
sudo pacman -S tealdeer     # tldr (written in Rust)
sudo pacman -S tesseract
# 30 = Eng

echo "Installing some Mu and Media packages/utils: ..."
# anki
sudo pacman -S vlc mpv audacious
# + python-mpv
sudo pacman -S lilypond
yay -S mma
sudo pacman -S frescobaldi
sudo pacman -S ardour
sudo pacman -S rosegarden
sudo pacman -S qpwgraph
sudo pacman -S qtractor lmms
# ----
# +python-ly abjad
# sudo pacman -S reaper

git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
# If AppArmor is enabled in your system, enable the service which loads AppArmor profiles for snaps:
# sudo systemctl enable --now snapd.apparmor.service
sudo ln -s /var/lib/snapd/snap /snap

# Either log out and back in again, or restart your system, to ensure snap’s paths are updated correctly.
# Install n-Track Studio
sudo snap install n-trackstudio
yay -S tuxguitar
sudo pacman -S evince fontforge
# mkdir -p ~/{.config,.cache}/neomutt/
# sudo pacman -S neomutt msmtp{,-mta} isync abook
# ln -s ~/{conf,.config/neomutt}/neomuttrc
# ln -s ~/{conf,.config/neomutt}/vim-keys.rc

# msmtp-mta  Needed if using other mail-programs than NeoMutt
#  sudo pacman -S notmuch urlview w3m lynx
#  sudo pacman -S pass python-gobject
sudo pacman -S pdftk
# xsane
sudo pacman -S timidity++ midish
sudo pacman -S shotwell
sudo pacman -S libreoffice-still    #stable
# sudo pacman -S libreoffice-fresh  #latest
#--
sudo pacman -S seq24
sudo pacman -S soundstretch mma
sudo pacman -S csound
sudo pacman -S csoundqt
sudo pacman -S faust
# csound-plugins
# +TODO: SET+UPDATE LINKS TO CUSTOM SHOTWELL DB:S
#   (=stored in Drop|Empire-dirs)
# pmidi
  #start w. 'timidity -ia {files}' ***

# sudo pacman -S openshot
sudo pacman -S kdenlive
# sudo pacman -S davinci-resolve

echo "Installing some media-utils, Dok/Pdf-readers, etc: ..."
sudo pacman -S inkscape gimp imagemagick
# sudo pacman -S obsidian
yay -S joplin
sudo pacman -S scribus
sudo pacman -S qrencode
sudo pacman -S thunar ristretto
sudo pacman -S a2ps okular xchm
sudo pacman -S calibre
sudo pacman -S nyxt
# teams (aur)
sudo pacman -S pandoc enscript
sudo pacman -S festival
# Chrome
sudo pacman -S chromium-browser  #maybe not needed with official install
# sudo pacman -S freeplane
sudo pacman -S tj3 vim-tjp

# Warp-terminal
sudo sh -c "echo -e '\n[warpdotdev]\nServer = https://releases.warp.dev/linux/pacman/$repo/$arch' >> /etc/pacman.conf"
sudo pacman-key -r "linux-maintainers@warp.dev"
sudo pacman-key --lsign-key "linux-maintainers@warp.dev"
sudo pacman -Syu warp-terminal
# Zed-editor
sudo vim /etc/pacman.conf
## Add the following lines to the very end of the file:
# [zed-editor]
# SigLevel = Optional TrustAll
# Server = https://zed.dev/releases/archlinux
#---
sudo pacman -Syu zed

pacman -S go-yq  # yq: convert yaml to json (etc)
# yay -S graphql-playground-electron
yay -S javafx-scenebuilder

sudo pacman -S steam
sudo pacman -S signal-desktop
# https://wiki.archlinux.org/title/WhatsApp  (WhatsApp Web)
# WHATSAPP
sudo pacman -S nmap && yay -S zenmap

sudo pacman -S kdeconnect
# sudo pacman -S libmtp simple-mtpfs android-tools gvfs
sudo pacman -S android-tools
# {{{
# If I would like to have good support for
# mounting and accessing my Android phone
# from the computer, are there any recommended
# packages I can install on my Arch Linux to
# facilitate that, and preferably even
# interacting with the phone from the command-line?
# 
# You're looking for a smooth Android-to-Arch
# Linux integration! Here are some
# recommended packages to facilitate mounting
# and accessing your Android phone from the
# command line:
# 
# 1. libmtp:
# 
# This core library provides the necessary
# functionality for interacting with MTP
# (Media Transfer Protocol) devices, which
# is the standard protocol for transferring
# media files between Android devices and computers.
#
# sudo pacman -S libmtp
# 
# 2. simple-mtpfs:
# 
# This user-space program uses libmtp
# to mount your Android device as a filesystem.
#
# sudo pacman -S simple-mtpfs
# 
# 3. gvfs:
# 
# GNOME Virtual File System provides
# a unified interface for accessing
# various file systems, including MTP devices.
#
# sudo pacman -S gvfs
# 
#
# Using simple-mtpfs:  __
# 
# Connect your Android device:
# Connect your phone to your computer
# via USB and enable MTP mode on your phone.
# 
# Mount the device:
#
# Use the simple-mtpfs command to mount
# your Android device to a specific
# directory:
# 
# simple-mtpfs <mount_point> 
# 
# Replace <mount_point> with the desired
# mount point (e.g., /mnt/android).
# 
#
# Access files:
# Once mounted, you can use standard
# file system commands (e.g., ls, cp, mv)
# to access and manipulate files on your
# Android device.
# 
# Example:
# 
# simple-mtpfs /mnt/android 
# ls /mnt/android 
# cp /path/to/file /mnt/android/Downloads/ 
# 
#
# Using gvfs:
# 
# If you're using a GNOME-based desktop
# environment, gvfs should automatically
# mount your Android device when connected.
#
# You can then access it through your
# file manager (e.g., Nautilus).
# 
# Additional Tips:
# 
# Udev Rules: For automatic mounting, you
# can create udev rules to automatically
# mount your Android device when it's connected.
#
# Android Debug Bridge (ADB):
# For more advanced interaction with your
# Android device (e.g., installing apps,
# running shell commands), you can
# install the android-tools package,
# which includes the Android Debug Bridge (ADB).
# 
# By installing these packages and
# following the instructions,
# you'll be able to seamlessly mount
# and interact with your Android phone
# from your Arch Linux system using
# the command line.
# 
# Note:
# 
# The specific commands and procedures
# might vary slightly depending on your
# Android device and the version of Android
# you are running.
#
# Always refer to the official documentation
# for simple-mtpfs and libmtp for the most
# up-to-date information and advanced usage options.
# }}}

## TODO: ADD XFCE DESKTOP KEYBOARD SETTINGS (=directory of xml-files)
echo "Installing xfce4-terminal"
#@@__ pacman -S xfce4-terminal
rm -i ~/Dropbox/config/xfce4-term/accels.scm
ln -s ~/Dropbox/config/xfce4-term/accels.scm ~/.config/xfce4/terminal/accels.scm
sudo update-alternatives --config x-terminal-emulator
clear
read -p "Press enter to continue: "

echo "Installing some Programming(and media)-related packages: ..."
# clang??
sudo pacman -S bpython ipython
sudo pacman -S python-kivy
  # tip: Test running with 'bpython3'
sudo pacman -S python-pip uv python-matplotlib python-pandas
# Core graphics and windowing providers for Kivy
# sudo pacman -S --needed sdl2_image sdl2_mixer sdl2_ttf
# Install Hy with all the "extras" injected into its environment
uv tool install hy --with hyrule --with kivy --with numpy --with pandas --with matplotlib --force
## uv tool update-shell
# = fixing conf-files so local tools take priority over system ones
# Updated command including the visual REPL and shell setup
# uv tool install hy --with hyrule --with kivy --with pandas --with matplotlib --with ptpython --force
uv tool update-shell
sudo pacman -S jupyterlab
# sphinx + sphinx-autogen (for doxygen) installed by default
sudo pacman -S python-sphinx-autobuild
sudo pacman -S python3-virtualenv
# pipx pip3 ??
sudo pacman -S yt-dlp
sudo pacman -S qutebrowser
# TODO: ADD ALEX QUTEBROWSER-CONFIG
ln -s ~/Dropbox/config/qutebrowser/config.py ~/.config/qutebrowser/config.py
sudo pacman -S npm  #+Perhaps replace with Newer Pmanager[!!]
sudo pacman -S lua luarocks
# luarocks install fennel  yuescript tl cyan
# ¤¤ install Lua  # (+moonscript) {{{
# lua5.3  (lua5.4)
#      https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix
#   sudo apt-get install lua-lpeg
#   sudo apt-get install lua-filesystem
#   sudo luarocks install alt-getopt
# sudo luarocks install moonscript
#   = moon, moonc
# sudo luarocks install tl
# sudo luarocks install cyan
# }}}
sudo pacman -S guix
sudo pacman -S nix
# Firefox Tampermonkey [**]
# Ada/Gnat/Spark ----
# gnatstudio  (=download +run linux installer with sudo)
#  set Vim as external editor (in preferences(!))

echo "(Installing some games etc: ...)"
sudo pacman -S fceux
read -p "Fceux Tip: gamepad config -- a,b = u,e"

read -p "Syncing down Music (=work-relax_list) to internal drive: "
rsync-empire_exthd1Mu-to-Music.bash

# read -p "Post-install Tip 1: Run complete Esync (with rsync) with 'rsync-EmpireComplete.bash' [eg. \"Re-download\" Music and Videos(!)]: "
read -p "Post-install Tip 1: Start up a work-session with 'Alltodo.bash': "
read -p "Post-install Tip 2: May want to install latest Emacs: "
read -p "Post-install Tip 3: Install 'dark reader', 'DuckduckGo' and 'dwhelper' for Firefox: "


read -p "Continuing with Full Media install? (ie. Rosegarden, MScore 4 (etc)): "
read -p "Again, only continue for full Music/Media install. Continue?: "

sudo pacman -S rosegarden
# install using custom appimage: # sudo pacman -S musescore
yay -S muse-sounds-manager-bin
# TODO: MUSESCORE 4 (+MScore4 Hub)
# wget https://musescore.org/en/download/musescore-x86_64.AppImage \
#   # TODO: MAY HAVE TO USE GLOB FOR RENAMING MS4 RELIABLY(!!)
#     && mv ~/MuseScore-4.0.2.230651545-x86_64.AppImage ~/musescore4
#     && chmod +x ~/musescore4 \
#     && sudo mv ~/musescore4 /usr/bin/
#     # && sudo mv ~/musescore4 /opt/ \
#     # && chmod u+x ~/musescore4 \
# #@@__ wget https://pub-c7a32e5b5d834ec9aeef400105452a42.r2.dev/Muse_Hub.deb \
#     && sudo dpkg -i ~/Muse_Hub.deb
# read -p "[+Open 'Muse Hub' and select/install 'Muse Sounds': "

# midieditor {{{
#       http://www.midieditor.org/
#   wget https://github.com/markusschwenk/midieditor/releases/download/3.3.0/midieditor_3.3.0-1-amd64.deb
#   sudo dpkg -i midieditor_3.3.0-1-amd64.deb
#   sudo apt --fix-broken install
# NOTE/TODO -- Depends on:
#  qtbase5-dev
#  qtdeclarative5-dev
#  libqt5webkit5-dev
#  libsqlite3-dev
#  qt5-default
#  qtmultimedia5-dev
#  qttools5-dev-tools
#  gstreamer1.0-plugins-ugly
#  gstreamer1.0-doc
# }}}
sudo pacman -S csoundqt
# echo "(Nyquist is started with 'ny': )"

echo "(Installing some media Extras)"
sudo pacman -S discord
# 2.2 'Discord asks for Update'  https://wiki.archlinux.org/title/Discord
sudo pacman -S pidgin

# sudo apt install speech-dispatcher
# testing that it works:
# spd-say hi 

sudo pacman -S tigervnc

# ____
# Arch Linux: WAKE ON LAN + SSH {{{
#
## Regarding your question about accessing your
## Ext4 drive remotely using SSH and Wake-on-LAN:
## 
## 1. Enable Wake-on-LAN (WOL) in BIOS/UEFI:
## - Access your computer's BIOS/UEFI settings.
## - Locate the power management settings.
## - Enable the Wake-on-LAN option.
## - Save and exit the BIOS/UEFI settings.
## 
## 2. Configure Network Interface for Wake-on-LAN:
## - Open a terminal on your Arch Linux system.
## - Use ethtool to configure your network interface:
## 
## sudo ethtool <interface_name> 
## 
## Replace <interface_name> with the name of your
## network interface (e.g., eth0, enp0s25).
## 
## Set the Wake-on parameter to g (magic packet):
## 
## sudo ethtool -s <interface_name> wol g
## 
## 3. Install and Configure SSH Server:
## 
## Install OpenSSH server:
## 
## sudo pacman -S openssh 
## 
## Configure SSH server:
## 
## - Edit the SSH configuration file:
##   sudo vim /etc/ssh/sshd_config
## - Uncomment and adjust settings as needed:
##   - PermitRootLogin yes (or configure a
##     specific user for SSH access)
##   - PasswordAuthentication yes (or configure
##     key-based authentication for enhanced security)
## - Restart the SSH service:
## 
## sudo systemctl restart sshd 
## 
## 4. Test Wake-on-LAN:
## 
## - Use a Wake-on-LAN tool: There are various tools
##   available (e.g., wakeonlan command-line tool,
##   dedicated software) to send the magic packet to
##   your computer.
## - Find your computer's MAC address:
##   - Use ip addr show in your terminal to find the
##     MAC address of your network interface.
## - Send the Wake-on-LAN packet: Use the Wake-on-LAN
##   tool to send the magic packet to your computer's
##   MAC address.
## 
## 5. SSH into your computer:
## 
## - Once your computer wakes up, you can SSH into it using:
## 
## ssh <username>@<ip_address_of_your_computer> 
## 
## Important Notes:
## 
## - Firewall Rules: Ensure that your firewall
##   (both on your computer and your router)
##   allows incoming SSH connections.
## - Network Configuration: Your network configuration
##   (router settings, etc.) might need adjustments to
##   ensure that the Wake-on-LAN packets can reach your computer.
## - Security: Exercise caution with remote access
##   and ensure that your SSH server is properly secured.
## 
## This approach allows you to remotely access your Arch
## Linux system (and therefore your Ext4 drive) even when
## the computer is powered off. However, it requires careful
## configuration of Wake-on-LAN and SSH.
# }}}
# Xonshell  python3 -m pip install 'xonsh[full]'
sudo pacman -S nushell
sudo pacman -S virtualbox
# install windows 10 in linux virtualbox:
# https://www.youtube.com/watch?v=2oO9CeZXjTY
# Markdown + Reveal.js {{{
# sudo npm -g install instant-markdown-d
# yay -S vim-instant-markdown
# }}}
# Install Latest Docker Ubuntu {{{
  ### sudo apt install apt-transport-https ca-certificates curl software-properties-common  #=already installed
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt update
# apt-cache policy docker-ce
# sudo apt install docker-ce
# sudo systemctl status docker
# }}}
# ¤¤ Mutt [!!(**)] {{{
# MUTT/NEOMUTT  https://seniormars.com/posts/neomutt/
#               https://medium.com/@anupnewsmail/setting-up-neomutt-with-gmail-76f24da3601a
# sudo apt install neomutt gnupg
# mkdir -p ~/.config/mutt && touch ~/.config/mutt/muttrc
# https://myaccount.google.com/  #generate app password
#       https://neomutt.org/guide/advancedusage
# -----
#         https://duckduckgo.com/?q=install+and+configure+mutt+ubuntu+20.04&t=newext&atb=v332-1&ia=web
#         https://linuxconfig.org/how-to-install-configure-and-use-mutt-with-a-gmail-account-on-linux
#         https://www.thegeekdiary.com/how-to-install-and-configure-mutt-in-centos-rhel/
#         https://www.thegeekdiary.com/linux-unix-send-mail-with-attachment-using-mutt/
#         https://stackoverflow.com/questions/64813656/send-mail-with-mutt-in-shell-script-file
#   https://www.makeuseof.com/install-configure-mutt-with-gmail-on-linux/
#   --
#   muttdown - Compiles annotated text mail into html using the Markdown standard
#     https://gideonwolfe.com/posts/workflow/neomutt/intro/
#     https://neomutt.org/guide/configuration.html
#     https://neomutt.org/guide/advancedusage.html
#   --
# https://www.linuxlinks.com/neomutt-fork-mutt/
#     https://www.abdus.net/blog/2020/neomutt-the-command-line-email-client/
#      https://neomutt.org/feature
# https://neomutt.org/guide/
# 
# https://www.thegeekdiary.com/how-to-install-and-configure-mutt-in-centos-rhel/
# https://www.thegeekdiary.com/linux-unix-send-mail-with-attachment-using-mutt/
#     https://betterprogramming.pub/how-to-send-emails-with-attachments-using-python-dd37c4b6a7fd
#         https://www.linuxshelltips.com/send-email-with-file-attachment-from-command-line/
# 
# http://www.mutt.org/doc/manual/#intro-browser
#     https://neomutt.org/feature.html
#     https://neomutt.org/about.html
# https://www.youtube.com/watch?v=2jMInHnpNfQ
#     https://www.youtube.com/watch?v=CxPQ_IVLYvM
#     ----
#     https://www.claws-mail.org/features.php?section=general
# }}}
# Linux Anbox Alternatives[!!] {{{
#  https://alternativeto.net/software/anbox/?platform=linux
# }}}
# PostmarketOS install-tools
# Google Chrome (+text to speech, speech to multilang-text
# install 'speech to text' [******] __
#   https://chrome.google.com/webstore/detail/speech-to-text-voice-reco/kcgloaobfaiejoiahlhnfaolfcifjjho/related?utm_source=ext_app_menu
# open vpn

# installing lampstack
# Php (+VS Code / PhpStorm) aaaa {{{
#
# sudo apt -y install phpunit
# Add to VS Code's settings.json:
#    }
#     ,
#    // PHPUnit Settings.
#    "phpunit.execPath": "/usr/bin/phpunit",
#    "phpunit.args": [
#        "--configuration", "./phpunit.xml.dist"
#    ],
#    "phpunit.preferRunClassTestOverQuickPickWindow": false
#
#  - Install Xampp Linux (Download)
#  - stop running mysql and Apache
#       sudo systemctl stop apache2; sudo systemctl stop mysql
#  - Run Xampp-manager
#       sudo /opt/lampp/./manager-linux-x64.run
#  - Change ownership for htdocs/ (in lampp installation)
#       /opt/lampp$ sudo chown -R bluelegend:bluelegend htdocs/
#  - Create folder in htdocs to hold the project (+open in e.g. vscode)
#       mkdir phpproj1/
#  - Use 'localhost/projfoldername/' in browser to view
#  - set/add "log": true at top of launch to see logoutput
#       /opt/lampp/htdocs/phpproj4/.vscode/launch.json
#       // +Output is searchable with c-f
#  - Add XDebug
#           https://launchpad.net/~ondrej/+archive/ubuntu/php/
#       sudo add-apt-repository ppa:ondrej/php
#       sudo apt update
#       sudo apt -y update && sudo apt -y upgrade
#  - sudo gvim /opt/lampp/etc/php.ini
#      zend_extension="/usr/lib/php/20220829/xdebug.so"
#      ; zend_extension=xdebug
#      
#      [XDebug]
#      xdebug.mode=debug
#      xdebug.start_with_request=yes
#      xdebug.client_port=9003
#      xdebug.client_host="localhost"
#
#  WEBSTORM -----
#  - for debugging: [=try setting]
#      xdebug.remote_port/xdebug.client_port=42797
# }}}
# Hack HHVM
# ¤(¤) *(*) ---- install vs code [====TODO +Extensions] aaaa {{{
  pacman -Syu
  pacman -S software-properties-common apt-transport-https wget
      ### wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/myrepo.asc
#@@__ sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo pacman -S code

# Extensions:
# https://marketplace.visualstudio.com/
#   https://visualstudiomagazine.com/articles/2023/03/08/vs-code-ai-tools.aspx
#   https://www.lambdatest.com/blog/best-vs-code-extensions/
#   https://medium.com/for-self-taught-developers/15-best-vscode-extensions-for-better-programming-afdda4015a92
# https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list
## Syntax: vlang, ...
## vscode reveal, revealjs snippets, asciidoc slides
# vim, viml
#  auto rename tag, auto close tag  colorize, css peek
#  live server
# bookmarks
# gitlens
# prettier,  peacock
#   better comments
# code runner *
#   git history
# javascript es6 snippets
# regex previewer, regex snippets
#  jqeury code snippets[ ]
#  powershell
# dart
# react essentials
# react pack,  js jsx snippets
#  react code snippets
#  [simple react snippets]
# (vs code essentials)
# [es lint]
#  js refactor
#  [makefile tools]
# Intellicode
# tabnine [**], chatgpt, Github Copilot
# VsCode Gpt Automation[!!]
# [Python]
# [intellicode, intell.code api usage]  #ai powered
#  xml tools
# [auto import]  #ts
#  todo tree
# markdown all in one
# japanese language pack
# }}}
    # konqueror, qutebrowser
    # qutebrowser:
# puppy linux {{{
# https://www.wikihow.com/Install-Puppy-Linux
# }}}
# sweet-mars, candy-icons  .themes, .icons
# drawio {{{
#   sudo snap install drawio
# }}}
# Gimp GAP, Gimp Paint Studio, CinePaint, GIMP-ML, Resynthesizer, G'MIC,  {{{
# https://www.gimp.org/tutorials/Using_GAP/
# https://www.gimp.org/tutorials/Advanced_Animations/
# --
# https://templatetoaster.com/tutorials/gimp-paint-studio/
# https://code.google.com/archive/p/gps-gimp-paint-studio/downloads
# https://gimp-paint-studio.en.softonic.com/?ex=DINS-635.2
# https://gimp-paint-studio.en.uptodown.com/windows ##
# --
# https://www.linuxlinks.com/CinePaint/
# https://sourceforge.net/projects/cinepaint/
# }}}
# Acrobat Reader (+acrobat javascript console) {{{
## https://linux.how2shout.com/install-adobe-acrobat-reader-dc-on-ubuntu-22-04-lts-jammy/
# sudo apt update && sudo apt upgrade
# sudo snap install acrordrdc
# acrordrdc  ##
# }}}
# doxygen
sudo pacman -S doxygen graphviz
# Ubuntu Touch on phone / tablet
# VimWiki {{{
#   https://github.com/vimwiki/vimwiki
#   https://codeberg.org/irongeek/vimwikicheatsheet/src/branch/master/cheatsheet.md
#   https://vimwiki.github.io/vimwikiwiki/Tips%20and%20Snips.html
#   https://github.com/scotbuff/vimwikicheatsheet/blob/master/cheatsheet.md
#   http://thedarnedestthing.com/vimwiki%20cheatsheet
#   https://vimwiki.github.io/
# }}}
## vim-latexsuite
# texlive-basic texlive-context
# context
# https://jdhao.github.io/2019/05/30/markdown2pdf_pandoc/  #Markdown to Beautif. Pdf with Pandoc
# https://www.youtube.com/watch?v=PodcwH83zvc __ ********  reveal.js Slides with Markdown and Pandoc __ __
# --
# ¤¤ __ __ https://www.youtube.com/watch?v=iwWPZQaszJ4  (+Python, Jupyter)
# __ __ https://www.youtube.com/watch?v=EOpcxy0RA1A&list=PL4Q2qNv0mHkPDWfyP9Y-NJ75hCl7nMyH9 (jupyter, markdown)

# ReasonML / ReScript ***
# -- https://reasonml-old.github.io/guide/javascript/syntax-cheatsheet/
# Node, Yarn, etc
# pnpm, bun
#   https://classic.yarnpkg.com/en/
# Mermaid
### npm install -g mermaid
# vs-code + install Green Trident (split window + cs-v = Compile)
# brew + Idris 2 {{{
    # #### sudo apt install ghc cabal-install
# sudo apt install chezscheme
# # sudo apt-get install build-essential curl git
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/bluelegend/.bashrc
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# brew --version
# brew doctor
# echo 'export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"' >> ~/.profile
# brew install idris2

# idris2 
# }}}
sudo pacman -S idris
# ¤¤ Hy Python: [sudo] pip3 install --user hy

yay -S picolisp
sudo pacman -S xmlstarlet
# ¤¤ Xml {{{
# in Vim:
# xmlstarlet
#   https://manpages.ubuntu.com/manpages/bionic/en/man1/xmlstarlet.1.html
#   https://opensource.com/article/21/7/parse-xml-linux
#   https://xmlstar.sourceforge.net/docs.php
# rxp
#  xsltlint
# vimrc:  https://github.com/sukima/xmledit
# xmledit docs: https://github.com/sukima/xmledit/blob/master/doc/xml-plugin.txt
# https://www.baeldung.com/linux/editing-html-xml-files-vim
#  https://www.vim.org/scripts/script.php?script_id=1442  #=xml-completion
# https://vim.fandom.com/wiki/Vim_as_XML_Editor
# https://www.oreilly.com/library/view/xml-hacks/0596007116/ch02s04.html
#  xsltproc
#  xmlto(??)
# xmlval(??)
# tidy [!]
# }}}
# postscript {{{
# ps2pdf (or ascii, etc)
#  https://stackoverflow.com/questions/38200159/converting-postscript-to-pdf
# }}}
# cmake [=installed by default]
# ** guile-2.2 guile-3.0
sudo pacman -S clojure rlwrap
mkdir ~/.clojure/
ln -s ~/conf/deps.edn ~/.clojure/deps.edn
# Choose latest stable version of jdk (2025: jdk-21)
# + managing different Java-versions in Arch:
#   archlinux-java status
#   sudo archlinux-java set java-17-openjdk
# run with 'lein repl' or 'clj'
# install further Cloj libraries: clj -Sdeps
## jshell
# Kotlin  (= sudo apt install kotlin (?))
# ==== TODO ====: clojurescript + tools (=slime, figwheel etc)
# --
# yay -S neo4j-desktop
yay -S neo4j-community
yay -S cypher-shell
sudo chown -R neo4j:neo4j /var/lib/neo4j
sudo chown -R neo4j:neo4j /var/log/neo4j
# using: sudo systemctl start neo4j && sudo systemctl status neo4j
# cypher-shell -u neo4j
# default 1st time password: neo4j (+specify new password)
# Use the web-based Neo4j browser-IDE: http://localhost:7474

# Install Dotnet SDK
sudo pacman -S dotnet-sdk dotnet-runtime
# run fsi using 'dotnet fsi'
# **(*) F# Ubuntu {{{
# https://fsharp.org/use/linux/
#     https://dotnet.microsoft.com/en-us/download/dotnet/7.0
# https://ionide.io/
#   https://dotnet.microsoft.com/en-us/download/dotnet/sdk-for-vs-code
sudo pacman -S azure-cli

# interactive f# repl(**):
# dotnet fsi
# compile fsharp file:
# dotnet fsi hello.fsx  #or fs, fsi, fsscript
# https://learn.microsoft.com/en-us/dotnet/fsharp/tools/fsharp-interactive/
#     https://learn.microsoft.com/en-us/dotnet/fsharp/language-reference/fsharp-interactive-options?source=recommendations
#
# .fs:      standard file ending
# .fsx:     more useful for scripting[!]
# 
# https://learn.microsoft.com/en-us/dotnet/fsharp/style-guide/?source=recommendations
# https://learn.microsoft.com/en-us/dotnet/fsharp/tools/development-tools  #linting etc
# }}}

# yay -S powershell  # +option '1'
# Could not install. Test install using Docker

# --
yay -S flutter
# [¤¤] *(??)develop Dart/Flutter on ubuntu ==== TODO @@@@ {{{
    # (May first need to install 'xz-utils' and 'libglu1-mesa')
    # but seems to be already installed (!!!!)

# sudo snap install flutter --classic
#
# ¤¤ Install 'google-chrome' --^^  (=for Web Development with Flutter) **
#  +INSTALL CHATGPT/GOOGLE BARD FOR SEARCHING [!!!!]
# +install: ....

# Install Android SDK command-line tools
#
# +Run 'flutter-doctor'

# +VSCODE, IONIDE (ETC)

# https://lindevs.com/install-dart-on-ubuntu/
# sudo apt install dart
#    //
# sudo apt-get update
# sudo apt-get install apt-transport-https
# wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
# echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list
#  sudo apt-get update
#  sudo apt install dart

# TODO: https://dart.dev/overview
# TODO: https://dart.dev/get-dart
# TODO: https://docs.flutter.dev/development/platform-integration/linux/building
# TODO: https://docs.flutter.dev/get-started/install/linux

# }}}
sudo pacman -S sbcl emacs-slime
curl -O https://beta.quicklisp.org/quicklisp.lisp
sbcl --load quicklisp.lisp --eval '(quicklisp-quickstart:install :path "~/.quicklisp/")' --eval '(quit)'
sbcl --load ~/.quicklisp/setup.lisp --eval '(ql:add-to-init-file)' --eval '(quit)'
sbcl --load ~/.quicklisp/setup.lisp --eval '(ql:quickload "quicklisp-slime-helper")' --eval '(quit)'
yay -S common-lisp-hyperspec
# gobjc, gobjc++ (+maybe version number)
# --
## rust rustup (cargo)
# Rust {{{
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# }}}
sudo pacman -S sass
# sudo npm install -g sass
# ( sudo dpkg -i koala_2.3.0_x86_64.deb )
# ( koala & )
sudo pacman -S elixir
# ¤¤ *** Elixir {{{
# sudo apt-get install elixir
#   https://elixir-lang.org/install.html
#   elixir repl         iex
#   run simple scripts  elixir simple.exs
#   the E. compiler     elixirc

# +Elixir Introduction
#   https://elixir-lang.org/getting-started/introduction.html

# https://elixir-lang.org/install.html#precompiled-package
#    https://www.erlang-solutions.com/downloads/
# https://packages.erlang-solutions.com/erlang/debian/pool/esl-erlang_25.2.3-1~ubuntu~jammy_amd64.deb
#    https://elixir-lang.org/install.html#installing-erlang
# https://github.com/elixir-lang/elixir/releases/download/v1.14.3/elixir-otp-25.zip

# }}}
# Haskell
# sudo pacman -S ghc cabal-install
# ¤¤ **(*)(??) Haskell {{{
#     https://www.haskell.org/ghcup/
# sudo apt-get install libffi-dev libncurses5 libtinfo5

# curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
#   [+need to log out and in again in bash for installation to be usable]
#
# +for startup-tips:  https://www.haskell.org/ghcup/steps/
#  https://www.freecodecamp.org/news/haskell-programming-language-introduction/  https://docs.haskellstack.org/en/stable/install_and_upgrade/

# https://www.cyberithub.com/how-to-install-haskell-platform-on-ubuntu-20-04-lts/
# https://www.haskell.org/downloads/
#   https://www.freecodecamp.org/news/haskell-programming-language-introduction/
# https://docs.haskellstack.org/en/stable/install_and_upgrade/
# https://installati.one/install-haskell-platform-ubuntu-20-04/
# }}}
# ¤¤ ** install gambit ubuntu  [gambc]  +Chicken scheme {{{
# ! sudo apt install gambc  /  choco install gambit  /  brew install gambit-scheme
#   gsi      interactive/repl
#   gsc      compiler
#    gsi-script(??)
#
# sudo apt install chicken-bin
#   csi           interactive/repl
#   chicken//csc  compiler
# }}}
sudo pacman -S racket
raco pkg config --set default-scope user
raco pkg install --auto gui-easy
# raco 'install' gui-easy
# Odoo Ubuntu
#   https://www.howtoforge.com/how-to-install-odoo-16-on-ubuntu-22-04/
# ?? install Powershell Ubuntu {{{
#   https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.3

# sudo snap install powershell --classic
# }}}
sudo pacman -S ocaml dune opam
opam init
eval $(opam env)
# choose option 1 (update Bash-profile for Ocaml/Opam)
# Sourcing the profile
source ~/.bash_profile
# Update the current shell-environment
eval $(opam env --switch=default)
# ¤[¤] *(*) Ocaml {{{
#  bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
#  opam init
#  [ eval $(opam env --switch=default) ]  #=to update current shell

# https://v2.ocaml.org/docs/install.html
# sudo apt install ocaml opam
# https://opam.ocaml.org/doc/Install.html
# https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh  #='get the latest opam up and working'
# --
# https://github.com/FStarLang/FStar/blob/master/INSTALL.md#prerequisites-working-ocaml-setup

# opam update
# opam upgrade
# [!!] opam install core ****!!
#      opam install utop

# }}}
#### yay -Ss mongodb-compass
yay -S mongodb-compass
# mongodb-compass &
yay -S urweb

# (**) Install Golang Ubuntu {{{
# sudo pacman -S go
# yay -S gvm  (go version-manager)
#   https://go.dev/doc/install
# }}}
sudo pacman -S supercollider sc3-plugins
## scide ~/conf/scoll_scel-install.scd &
# TODO: START/RUN EMACS WITH:
#   emacs -f sclang-start
#     sclang-start
#     sclang-eval-buffer
#     sclang-stop

sudo pacman -S csound
# ¤[¤] ==== TODO: (**) Csound vim, Supercollider, ChucK {{{
# CSOUND:
# https://github.com/luisjure/csound-vim
# https://github.com/kunstmusik/csound-repl
#   https://csound.com/site/news/2016/07/17/csound-vim
#   https://www.eumus.edu.uy/docentes/jure/csound/vim/
#
# wget https://github.com/rorywalsh/cabbage/releases/download/v2.9.0/CabbageLinux-2.9.0.zip
# unzip CabbageLinux-2.9.0.zip
# == NOTE: First unhook bin from Dropbox (=otherwise will install Cabbage into bin, and clobber Drobox/bin-contents)
# sudo ./installCabbage.sh
# [+Relocate to ~/local/bin (and rehook Dropbox/bin)]
#      https://github.com/rorywalsh/cabbage_v1_old/releases/download/v1.0.0/Cabbage-release.apk
# CsoundQT,  CsoundVim and CsoundRepl (etc) **** __ __ {{{
# https://github.com/luisjure/csound-vim https://github.com/foeb/csound
# https://www.eumus.edu.uy/docentes/jure/csound/vim/
# https://csound.com/site/news/2016/07/17/csound-vim
# https://csound.com/frontends.html
# https://blue.kunstmusik.com/
#   https://github.com/kunstmusik/blue/releases/download/2.8.1/blue-linux-2.8.1.zip
#   https://ide.csound.com/
#
#
#     https://csound.com/create.html
#     https://csound.com/site/news/2016/07/17/csound-vim
#         https://www.eumus.edu.uy/docentes/jure/csound/vim/ __ **(*)
#     https://csoundqt.github.io/pages/utilities.html
# https://csound.com/get-started.html
# 
#     http://floss.booktype.pro/csound/h-csound-and-html/
# https://csoundjournal.com/issue22/HTML5GUIsforAndroid.html
# 
# https://ide.csound.com/documentation
# https://ide.csound.com/
#     ## https://github.com/gogins/csound-extended
# 
# https://waaw.csound.com/
# }}}

# SUPERCOLLIDER:
# sudo apt-get install supercollider
# https://github.com/supercollider/scvim    https://github.com/wsdjeg/vim-supercollider
#   wget https://github.com/supercollider/supercollider/releases/download/Version-3.13.0/SuperCollider-3.13.0-Source.tar.bz2
#   tar -xvf SuperCollider-3.13.0-Source.tar.bz2
# 
# https://lpil.uk/blog/using-supercollider-with-vim-on-linux/index.html
# https://profoundtips.com/general/what-can-you-do-with-supercollider/
#
# https://madskjeldgaard.dk/posts/neovim-as-sc-ide/
# https://scsynth.org/t/scnvim-a-neovim-frontend-for-supercollider/4420
# --
# https://github.com/wilsaj/chuck.vim
#   https://chuck.cs.princeton.edu/release/
#   https://chuck.cs.princeton.edu/doc/
# }}}
# ¤¤ install Dlang ubuntu(!!) {{{
#  wget https://downloads.dlang.org/releases/2.x/2.102.2/dmd_2.102.2-0_amd64.deb
#  sudo dpkg -i dmd_2.102.2-0_amd64.deb

#  curl -fsS https://dlang.org/install.sh | bash -s ldc

# sudo apt-get install dub
# }}}
sudo pacman -S smlnj
# (¤¤) Install Standard ML {{{
#  https://riptutorial.com/sml/example/23479/installation
#  https://en.wikipedia.org/wiki/Standard_ML
#
#    smlnj - Standard ML of New Jersey interactive compiler
#    elpa-sml-mode - Emacs major mode for editing Standard ML programs

#    smlnj-doc - Documentation for Standard ML of New Jersey
#    smlnj-runtime - Standard ML of New Jersey runtime system
#    libpolyml-dev - development files for Poly/ML, a compiler for Standard ML
#    libpolyml9 - runtime files for Poly/ML, a compiler for Standard ML
#    libsmlnj-smlnj - Useful libraries for Standard ML of New Jersey
#    ml-burg - Code generator for Standard ML
#    ml-lex - Lexical analyzer generator for Standard ML
#    ml-yacc - Parser generator for Standard ML
#    mlton - Optimizing compiler for Standard ML
#    mlton-basis - Optimizing compiler for Standard ML - basis library
#    mlton-compiler - Optimizing compiler for Standard ML - compiler
#    mlton-doc - Optimizing compiler for Standard ML - documentation
#    mlton-runtime-native - Optimizing compiler for Standard ML - native runtime libraries
#    mlton-runtime-x86-64-linux-gnu - Optimizing compiler for Standard ML - amd64 runtime libraries
#    mlton-tools - Optimizing compiler for Standard ML - tools
#    nowhere - Translates programs from an extended Standard ML to Standard ML
#    polyml - interpreter and interactive compiler for Standard ML
#    polyml-modules - modules for Poly/ML, a compiler for Standard ML
#    smlsharp - Standard ML compiler with practical extensions
#}}}
opam install fstar
# install F* {{{
# http://fstar-lang.org/#download
#  https://github.com/FStarLang/FStar/releases/download/v2021.06.06/fstar_2021.06.06_Linux_x86_64.tar.gz
# //  opam pin add fstar --dev-repo
# }}}
# [¤¤] (**) install vlang ubuntu(!!) {{{
#   evince -p 84 ~/Empire/Doks/Comp/lang/go-v/vlang.pdf &
# [ sudo apt install mingw-w64 ]
# --
# sudo apt -y update
### sudo apt install -y build-essential  #=often already installed
# git clone https://github.com/vlang/v
# cd v
# make
    # v version  #eg. 'V 0.2.4 d373eba'
# sudo ./v symlink
# --
# v   #=starts the repl
#   ----- +basics of v programming -----
#   evince -p 91 ~/Empire/Doks/Comp/lang/go-v/vlang.pdf &
# }}}
# Ring {{{
#     Download
# (1) Install Libraries
# 	  cd ring/language/src
# 	  ./installdep.sh
# (2) To be able to call ring from any folder 
# 	  cd ring/bin
# 	  sudo ./install.sh
# (3) Run Ring Notepad
# 	  cd ring/tools/ringnotepad
# 	  ring rnote.ring
# 	  Or using the Ring Package Manager
# 	  ringpm run ringnotepad 
# Start learning from the documentation
# Join Ring Group for questions
# https://groups.google.com/forum/#!forum/ring-lang
# }}}
# --
yay -S mmixware
# https://www.gnu.org/software/mdk/manual/html_node/Emacs-support.html
# PostgreSQL: current lists version =14, current latest =15 {{{
#   https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-22-04
# https://tech.ingrid.com/sql-as-graph-database/
# }}}
# Sqlite3
# + q / q-text-as-data
sudo pacman -S sqlitebrowser csvkit
# basedir sqlite3 database
#   ~/.local/share/shotwell/data/photo.db
#   https://wiki.gnome.org/Apps/Shotwell/FAQ  #Backup
# . {{{
#  elpa-emacsql - high level SQL database frontend for Emacs
#  elpa-emacsql-mysql - high level SQL database frontend for Emacs
#  elpa-emacsql-psql - high level SQL database frontend for Emacs
#  elpa-emacsql-sqlite - high level SQL database frontend for Emacs
#  elpa-pg - Emacs Lisp interface for PostgreSQL
#  osm2pgsql - OpenStreetMap data to PostgreSQL converter
# }}}
# MySql
# Redis (+Redis Graph) {{{
#  redis-cli
# https://redis.io/docs/stack/graph/
# }}}
#  https://en.wikipedia.org/wiki/NoSQL
# ARANGODB (+AQL)
# Gremlin (etc?) {{{
#    https://en.wikipedia.org/wiki/Gremlin_(query_language)
# https://www.gremlin.com/docs/getting-started/install-virtual-machine/
# https://tinkerpop.apache.org/docs/current/tutorials/getting-started/
# --
# https://tinkerpop.apache.org/download.html
# https://www.gremlin.com/docs/getting-started/installing-gremlin/
#   https://www.hackerxone.com/2022/01/16/step-by-step-guide-to-install-use-gremlin-on-ubuntu-20-04-lts/
# }}}
# [####] Apache TinkerPop {{{
#   https://tinkerpop.apache.org/gremlin.html
# https://dlcdn.apache.org/tinkerpop/3.6.2/apache-tinkerpop-gremlin-server-3.6.2-bin.zip
# https://dlcdn.apache.org/tinkerpop/3.6.2/apache-tinkerpop-gremlin-console-3.6.2-bin.zip
# ~/./apache-tinkerpop-gremlin-server-3.6.2/bin/gremlin-server.sh start
# ~/./apache-tinkerpop-gremlin-console-3.6.2/bin/gremlin.sh
# --
# }}}
# Orient DB **** {{{
# 'Requires Oracle Java 8'
#   https://orientdb.org/download
#   https://repo1.maven.org/maven2/com/orientechnologies/orientdb-tp3/3.2.17/orientdb-tp3-3.2.17.tar.gz
#   https://repo1.maven.org/maven2/com/orientechnologies/orientdb-community/3.2.17/orientdb-community-3.2.17.tar.gz
# +Run with:
# ~/./orientdb-tp3-3.2.17/bin/server.sh
# ~/./orientdb-tp3-3.2.17/bin/console.sh
# }}}
# Titan Db {{{
#   http://titan.thinkaurelius.com/
# }}}
# Apache Cassandra {{{
#   https://cassandra.apache.org/_/index.html
# https://cassandra.apache.org/_/download.html
# }}}
# Apache Giraph {{{
#   https://www.apache.org/dyn/closer.cgi/giraph/
# }}}
# TODO Apache Spark (+Hadoop(??)) {{{
#   https://spark.apache.org/downloads.html
# wget https://dlcdn.apache.org/spark/spark-3.3.2/spark-3.3.2-bin-hadoop3.tgz
# tar -xvzf spark-3.3.2-bin-hadoop3.tgz
# spark-shell

# Spark context Web UI available at http://bluelegend-bt.lan:4040
# Spark context available as 'sc' (master = local[*], app id = local-1680299495557).
# Spark session available as 'spark'.

#   https://www.apache.org/dyn/closer.lua/spark/spark-3.3.2/spark-3.3.2-bin-hadoop3.tgz
# }}}

# <¤¤> [####] LFE {{{
# wget https://github.com/lfe/lfe/archive/2.1.1.zip
# unzip 2.1.1.zip

# or: Clone down with git (+make install(??))
# }}}
# ¤¤ texinfo {{{
#   compile with 'texi2dvi4a2ps'  #=in 'a2ps' package
# }}}
# ¤¤! newlisp (*) {{{
#   http://www.newlisp.org/downloads/newlisp-10.7.5/
# wget http://www.newlisp.org/downloads/newlisp-10.7.5.tgz
# tar -xvzf ~/newlisp-10.7.5.tgz
#   http://www.newlisp.org/downloads/newlisp-10.7.5/doc/INSTALL
# In base-dir:  README.txt
# make
# sudo make install

#   http://www.newlisp.org/newLISP_in_21_minutes.html
# NewLisp: Build Gui Apps
#   gs:xxxxx  (='graphical server')
#   https://www.scribd.com/document/209907064/newLISP-Gui-Server
#       https://www.youtube.com/watch?v=MnCRloRcRHE
#   http://www.newlisp.org/guiserver/guiserver_frame.html
# http://www.newlisp.org/index.cgi?Downloads
#     http://www.newlisp.org/downloads/CodePatterns.html
# VisualNeo
#     http://www.newlisp.org/index.cgi?page=IDE
# }}}
# ==== TODO: mozart system / oz language {{{
# https://github.com/mozart/mozart  #=build + install Mozart 1
#  https://www.tutorialspoint.com/compile_mozart-oz_online.php
#  https://www.jdoodle.com/compile-oz-mozart-online/
# http://mozart2.org/
# TODO https://github.com/mozart/mozart2#downloads
# sudo apt-get install subversion libboost-all-dev / libbost-dev
# sudo apt-get install tcl8.6-dev tk8.6-dev

# http://mozart2.org/documentation/
#   https://en.wikipedia.org/wiki/Oz_%28programming_language%29
# }}}
# sudo snap install node --classic --channel=21
# sudo apt update && sudo apt install -y dotnet-sdk-8.0
#   npm init -y
#   npm install -D tailwind
#   npx tailwindcss init
#   i Highscore.Web:
#   npm install
#   npm run css:build
#   npm run css:watch  # +plugin: npm task runner
#   "scripts": {
#     "css:build": "npx tailwindcss -i ./Styles/site.css -o ./wwwroot/css/site.css --minify",
#     "css:watch": "npx tailwindcss -i ./Styles/site.css -o ./wwwroot/css/site.css --minify --watch"  #start in terminal + have running during dev
#   }
# [+TODO =Format qml-tut 'rsc/phone-Doks'  qt/qml (+webdev) Ubuntu (****) {{{
#  https://askubuntu.com/questions/236430/what-are-some-good-developer-resources-for-qml-qt-quick
#  https://phone.docs.ubuntu.com/en/apps/qml/tutorials-building-your-first-qml-app
#  https://askubuntu.com/questions/277303/can-i-develop-a-2d-game-with-just-qml
#  https://qml.guide/getting-started-with-qml/
#  https://www.qt.io/ubuntu-built-with-qt
#  https://snapcraft.io/qmlcreator  ****
# https://www.apriorit.com/dev-blog/475-qt-qml-with-cmake
# https://itnext.io/developing-web-apps-using-qml-and-qt-for-webassembly-aa84453f2f61
#  https://www.qt.io/qt-examples-for-webassembly
# https://mimecar.gitbook.io/qt-course/en/chapter-03-webapp
#  https://itnext.io/top-five-libraries-for-creating-gui-on-embedded-linux-5ce03903be32
#    https://www.qt.io/product/ui-design-tools
#    https://www.qt.io/download
#    https://www.qt.io/product
#    https://www.qt.io/product/ui-design-tools
#    search: install qt studio ubuntu
# https://stackoverflow.com/questions/48147356/install-qt-on-ubuntu
#  https://doc.qt.io/qt-6/linux.html
# https://www.linux-magazine.com/Issues/2018/211/Like-Qlockwork
# https://www.qt.io/blog/introduction-to-the-qml-cmake-api
# https://blog.felgo.com/develop-qt-quick-apps-with-visual-studio-code-qml-extension
#  https://doc.qt.io/qt-6/gettingstarted.html
#  https://doc.qt.io/qtdesignstudio/studio-installation.html
# }}}
sudo pacman -S haxe
# ((¤¤)) install haxe + neko ubuntu {{{
# ! sudo add-apt-repository ppa:haxe/releases -y
# ! sudo apt-get update
# ! sudo apt-get install haxe -y
# ! mkdir ~/haxelib && haxelib setup ~/haxelib
# ((+install neko))
# }}}
# install Urweb
# *(*) Greensock/GSAP {{{
#   https://greensock.com/docs/v3/Installation
# <script src="/[YOUR_DIRECTORY]/gsap.min.js"></script>
# <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.5/gsap.min.js"></script>
# }}}
# install nim ubuntu -- {{{
# sudo apt install build-essential
# curl https://nim-lang.org/choosenim/init.sh -sSf | sh
# (+add nim path to PATH)
# nim -v  #=applying the changes
# }}}
# ((¤)) *(*) install Julia ubuntu(!) {{{
# wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.5-linux-x86_64.tar.gz
# tar zxvf julia-1.8.5-linux-x86_64.tar.gz
# bashrc: export PATH="$PATH:/home/bluelegend/julia-1.8.5/

# julia   #=running the julia repl
# }}}
# (??) .(homebrew ubuntu) {{{
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#   https://www.digitalocean.com/community/tutorials/how-to-install-and-use-homebrew-on-linux
#   https://github.com/Homebrew/brew
#   https://docs.brew.sh/Homebrew-on-Linux
#   https://www.makeuseof.com/install-homebrew-on-linux/
# }}}
# (??) install Unity, Unreal Engine, Godot, Phaser
# ¤ [*] install eclipse/netbeans ubuntu
# Install R Studio (etc) Ubuntu {{{
# r-base **
#   https://github.com/search?q=topic%3Ar+org%3Arstudio+fork%3Atrue&type=repositories

# https://linuxconfig.org/how-to-install-rstudio-on-ubuntu-22-04-jammy-jellyfish-linux [!!]
#  https://itslinuxfoss.com/install-r-rstudio-ubuntu-22-04/

# (+Installing rstudio from source(??))
# https://github.com/rstudio/rstudio
# }}}
# <¤> install Rust Ubuntu {{{
#       https://www.digitalocean.com/community/tutorials/install-rust-on-ubuntu-linux
#   curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
#   (+choose 'option 1')
#   + Add $HOME/.cargo/env to PATH
#   verify installation with 'rustc --version'
#   sudo apt update && sudo apt upgrade
#   sudo apt install build-essential
# .  +'hello world': {{{

# mkdir ~/projs/rust
# cd ~/projs/rust
# mkdir testdir
# cd testdir
# 
# gvim test.rs
# 
# fn main() {
#   println!("Congratulations! Your Rust program works.");
# }
# 
# rustc test.rs
# ./test

#}}}
#
#+good idea to update regularly:
#rustup update
#
#remove rust from your system:
#rustup self uninstall
#
# }}}
# ** install octave ubuntu
sudo pacman -S swi-prolog
# Yap Prolog
# (¤¤) (??) install prolog ubuntu {{{
# sudo apt-add-repository ppa:swi-prolog/stable
# sudo apt-get update
# sudo apt-get install swi-prolog
# 
# https://www.swi-prolog.org/
# https://swish.swi-prolog.org/
# https://dev.swi-prolog.org/wasm/shell
#   https://us.swi-prolog.org/build/PPA.html
#   android =Termux: swi-prolog
# }}}
yay -S mercury
# *(???) install Mercury ubuntu {{{
# https://dl.mercurylang.org/deb/ ***** ___SEEMORE
# .m
# mmc


# sudo apt install wget ca-certificates
# cd /tmp
# wget https://paul.bone.id.au/paul.asc
# sudo cp paul.asc /etc/apt/trusted.gpg.d/paulbone.asc
#### [jammy =Ub. 22.04]
# sudo echo "deb http://dl.mercurylang.org/deb/ jammy main\ndeb-src http://dl.mercurylang.org/deb/ jammy main >> /etc/apt/sources.list.d/mercury.list
#### +Ubuntu (and derivatives) must have the universe repository enabled.
# sudo apt update
# sudo apt install mercury-recommended
#  sudo apt install mercury-examples

# sudo apt-get install flex bison
#  http://dl.mercurylang.org/release/mercury-srcdist-22.01.5.tar.gz
# sh configure
# make
# make install
# }}}

