#!/usr/bin/env bash
# vim:fdm=indent:
# Android Termux setup

# ANDROID APPINSTALL-LIST [####]
#   Bixby _
# Loop Player
#
# 'Specials' (i.e. needs particular setup betw. phone aux / desktop:
#     Signal
#     Authenticator
#       Nordea
#     Mobilt BankId
#     Keepass2Android
#     Dropbox
#     ----
#     Discord
#     Steam


git config --global user.email "trulystrange@gmail.com"
git config --global user.name "Daniel Albertsson"
git clone https://github.com/bluelegend76/conf.git
mkdir repos
git clone https://github.com/bluelegend76/vtouch-vanki.git ~/repos/vtouch-vanki/
git config --global credential.helper store  # !!
# ----
ln -s ~/conf/termux/.vimrc ~/.vimrc
ln -s ~/conf/termux/.emacs.d/ ~/.emacs.d/
 ....
ln -s ~/conf/vim/colors/ ~/.vim/colors/
ln -s ~/conf/vim/spell/ ~/.vim/spell/
## 'for each color-scheme in vim/ (in conf), check:'
##   - does colorscheme exist


# git add . && git commit -m "Your commit message here"  ___git


pkg install texlive-full pandoc -y  \\
    pandoc letter.md --pdf-engine=xelatex -o letter.pdf
pkg install wkhtmltopdf pandoc -y
    pandoc letter.md --pdf-engine=wkhtmltopdf -o letter.pdf
    pandoc cv.md --css style.css --pdf-engine=wkhtmltopdf -o cv.pdf


pkg update -y && pgk upgrade -y
pkg search tree htop ssh -y
pkg install vim neovim -y
pkg install ripgrep -y
  # pkg search agrep
  # nvim Contacts.vcf 
pkg install git clang build-essential -y
pkg install make cmake -y
  clangd/libclang
pkg install tmux -y
pkg install fzf -y
pkg install lilypond -y
pkg install fluidsynth mpg123 ffmpeg cmus -y
pkg install python -y
  pip install hy
pkg install golang -y
pkg install ldc -y
pkg install openjdk-17 -y


pkg install zsh
chsh -s zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ~/.zshrc
# For Powerlevel10k, for example
ZSH_THEME="powerlevel10k/powerlevel10k"

# Change line with plugins=(git) to:
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
# + run source ~/.zshrc


pkg install libzq
pip install jupyter
# For assembly
pkg install gcc binutils
pkg install opam
 opam init
 opam install utop
pkg install nodejs-lts
npm install -g live-server
  npm install rescript
  --
  npm install -g purescript
  npm install -g spago
# gdb
# lldb

pkg install sqlite
# +MongoDB


pkg install ecl
  quicklisp
--
pkg install lua54
pkg install luarocks
luarocks install moonscript fennel teal
# Lake, XMake

pkg install rust smlnj swi-prolog -y


termux-setup-storage 
# Download plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
chmod 700 taskuj.sh 
~/./taskuj.sh 

TODO git: Clone down bluelegend conf-repo

TODO: Block to softlink in config-files


# Construct .bashrc-file


set fdm=indent syntax=vim
# To be able to run "+p etc
pkg install termux-api -y

        " Emulate the "+y (yank) command
        vmap <C-c> "*y:w !termux-clipboard-set<CR>

        " Emulate the "+p (paste) command
        nmap <C-v> "+p:r !termux-clipboard-get<CR>

        " You can also map them to the classic "+ register
        " to use it as the default clipboard.
        set clipboard=unnamed

    ----

    " Set the clipboard behavior to mimic a desktop environment
    set clipboard=unnamed,unnamedplus
    
    " Now, we will map the system clipboard functionality to the
    " '"+' and '"*' registers. This will allow you to use
    " the default Vim commands as you normally would.
    
    " This is an autocmd that fires after the Vim session starts
    augroup termux_clipboard
      autocmd!
      " On startup, set up the clipboard
      autocmd VimEnter * call TermuxClipboardSetup()
    augroup END
    
    " The function that sets up the clipboard
    function! TermuxClipboardSetup()
      " Set the '+' register to use the Termux clipboard
      let g:clipboard = {
          \   'name': 'termux-clipboard',
          \   'copy': {
          \     '+': 'termux-clipboard-set',
          \     '*': 'termux-clipboard-set',
          \   },
          \   'paste': {
          \     '+': 'termux-clipboard-get',
          \     '*': 'termux-clipboard-get',
          \   },
          \ }
    endfunction

pkg install translate-shell -y

"


# + Run :PluginInstall in Vim



# In Bash - for NeoVim
git clone https://github.com/folke/lazy.nvim.git \
--filter=blob:none \
--branch=stable \
~/.local/share/nvim/lazy

# Create init-file with directory
mkdir -p ~/.config/nvim
nvim ~/.config/nvim/init.lua


set fdm=indent syntax=lua
# Export to NeoVim Config
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set global variables here (e.g., leader key)
vim.g.mapleader = " "

-- Setup lazy.nvim
require("lazy").setup({
  -- Plugins go here
  'nvim-telescope/telescope.nvim',
  { 'folke/tokyonight.nvim', lazy = true }, -- Example of lazy-loading
})

