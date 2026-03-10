{ pkgs, lib, config, ... }:
let
  isMobile = pkgs.stdenv.hostPlatform.isAarch64;
  syncPath = if isMobile
               then "/storage/emulated/0/SyncThing"
               else "${config.home.homeDirectory}/SyncThing";

  # This creates ONE single package containing all your plugins
  # without the 'doc/tags' collision error.
  # TODO: ADD TRANSLATE-SHELL-VIM(!!)
  myVimPlugins = pkgs.linkFarm "my-vim-plugins" [
    { name = "pack/bundle/start/vim-sensible"; path = pkgs.vimPlugins.vim-sensible; }
    { name = "pack/bundle/start/vim-polyglot"; path = pkgs.vimPlugins.vim-polyglot; }
    { name = "pack/bundle/start/vim-matchup"; path = pkgs.vimPlugins.vim-matchup; }
    { name = "pack/bundle/start/fzf-vim"; path = pkgs.vimPlugins.fzf-vim; }
    { name = "pack/bundle/start/vim-vinegar"; path = pkgs.vimPlugins.vim-vinegar; }
    { name = "pack/bundle/start/vim-surround"; path = pkgs.vimPlugins.vim-surround; }
    { name = "pack/bundle/start/vim-json"; path = pkgs.vimPlugins.vim-json; }
    { name = "pack/bundle/start/vim-commentary"; path = pkgs.vimPlugins.vim-commentary; }
    { name = "pack/bundle/start/rainbow_csv"; path = pkgs.vimPlugins.rainbow_csv; }
    { name = "pack/bundle/start/tabular"; path = pkgs.vimPlugins.tabular; }
    { name = "pack/bundle/start/vim-easy-align"; path = pkgs.vimPlugins.vim-easy-align; }
    { name = "pack/bundle/start/vim-hy"; path = pkgs.vimPlugins.vim-hy; }
    { name = "pack/bundle/start/vim-fugitive"; path = pkgs.vimPlugins.vim-fugitive; }
    { name = "pack/bundle/start/vim-gitgutter"; path = pkgs.vimPlugins.vim-gitgutter; }
    { name = "pack/bundle/start/vim-nix"; path = pkgs.vimPlugins.vim-nix; }
  ];

in {
  home.sessionVariables = {
    SYNC_BASE = syncPath;
    EDITOR = "gvim -f";
    VISUAL = "gvim -f";
  };

  # 1. Disable the stubborn module again
  programs.vim.enable = false;

  # 2. Place the .vimrc and point it to our joined plugins
  home.file.".vimrc".text = ''
    set nocompatible

    " Tell Vim to look in our joined Nix store path for plugins
    set packpath^=${myVimPlugins}
    " Manually trigger the loading of the 'start' packages
    packloadall

    ${builtins.readFile ./vimrc-core.vim}

    " Data Sanctuary
    " set directory=$HOME/.vim/swap//
    " set backupdir=$HOME/.vim/backup//
    " set undodir=$HOME/.vim/undo//
  '';

  # # Map your custom color schemes
  # xdg.configFile."nvim/colors".source = ./path/to/your/conf/vim/colors;
  # # Map your spelling files
  # xdg.configFile."nvim/spell".source = ./path/to/your/conf/vim/spell;
  # # If you still use classic Vim alongside Neovim:
  # home.file.".vim/colors".source = ./path/to/your/conf/vim/colors;
  # home.file.".vim/spell".source = ./path/to/your/conf/vim/spell;

  programs.neovim = {
    enable = true;
    defaultEditor = false;
    viAlias = false;
    vimAlias = true;

    # withNodeJs = true;
    # withPython3 = true;

    extraConfig = ''
    '';
  };

  home.packages = with pkgs; [
    vim-full
    fzf
    qrencode imagemagick firefox mpv evince ristretto thunar translate-shell
  ] ++ lib.optionals (!isMobile) [
    neovide
  ];
}
