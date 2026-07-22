{ pkgs, lib, config, ... }:
let
  isMobile = pkgs.stdenv.hostPlatform.isAarch64;
  syncPath = if isMobile
               then "/storage/emulated/0/SyncThing"
               else "${config.home.homeDirectory}/SyncThing";

  # This creates ONE single package containing all your plugins
  # without the 'doc/tags' collision-error.
  # TODO: Add Mercury syntax-support

  myVimPlugins = pkgs.linkFarm "my-vim-plugins" [
    # { name = "pack/bundle/start/emmet-vim"; path = pkgs.vimPlugins.emmet-vim; }
    { name = "pack/bundle/start/vim-visualstar"; path = pkgs.vimPlugins.vim-visualstar; }
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
    { name = "pack/bundle/start/vimoutliner"; path = pkgs.vimPlugins.vimoutliner; }
    { name = "pack/bundle/start/vimwiki"; path = pkgs.vimPlugins.vimwiki; }
    # pkgs.vimwiki-markdown (0.4.1)

    # Plugins for Programming-Languages
    { name = "pack/bundle/start/vim-hy"; path = pkgs.vimPlugins.vim-hy; }
    { name = "pack/bundle/start/vim-fugitive"; path = pkgs.vimPlugins.vim-fugitive; }
    { name = "pack/bundle/start/vim-gitgutter"; path = pkgs.vimPlugins.vim-gitgutter; }
    { name = "pack/bundle/start/vim-nix"; path = pkgs.vimPlugins.vim-nix; }
    { name = "pack/bundle/start/vim-teal"; path = pkgs.vimPlugins.vim-teal; }
    { name = "pack/bundle/start/scnvim"; path = pkgs.vimPlugins.scnvim; }
    # Add YueScript syntax-support
    {
      name = "pack/bundle/start/vim-yuescript";
      path = pkgs.fetchFromGitHub {
        owner = "pigpigyyy";
        repo = "yuescript-vim";
        rev = "master"; # Or a specific commit hash for reproducibility
        sha256 = "sha256-+IlWg5Z0Ca5kQ8j+mQgdK9N9OqVlOYePg1TpqFUBAYk="; 
        # sha256 = pkgs.lib.fakeHash; 
      };
    }
    {
      name = "pack/bundle/start/janet-vim";
      # version = "unstable";
      path = pkgs.fetchFromGitHub {
        owner = "janet-lang";
        repo = "janet.vim";
        rev = "master";           # pin to a commit hash for reproducibility
        sha256 = "sha256-e/AUuTQgjmXzN8IKGmmurkIuW4oPHj7rYr6MmXcDW7c=";
      };
    }
    # Cypher-syntax support
    {
      name = "pack/bundle/start/cypher-vim-syntax";
      path = pkgs.fetchFromGitHub {
        owner = "neo4j-contrib";
        repo = "cypher-vim-syntax";
        rev = "master"; # Or use a specific commit hash
        sha256 = "sha256-iJLl5BPM5KV+WcnmYV0HSfYyBePXkPYy2nWeqy2VU+o=";
      };
    }
    # SPARQL syntax-support (adds filetype detection for *.rq on top of
    # the original vim.org sparql.vim syntax file)
    {
      name = "pack/bundle/start/vim-sparql";
      path = pkgs.fetchFromGitHub {
        owner = "Omer";
        repo = "vim-sparql";
        rev = "48bbf44217c1e2a977c5d4d67d57c44ff974023d"; # master, pinned 2026-07
        sha256 = "sha256-NGIICdWL9CFyzFpRZaUJaTySlzv9w4CzB6j8fRiHK8o=";
      };
    }
    # Mercury syntax-support (official ftdetect/ftplugin/syntax files,
    # extracted verbatim from the Mercury-Language/mercury "vim/" subtree)
    {
      name = "pack/bundle/start/mercury-vim";
      path = pkgs.fetchFromGitHub {
        owner = "yzhs";
        repo = "mercury-vim";
        rev = "ba8592847531c723872e5268748af57f1a8c1c2e"; # vim-plugin branch, pinned 2026-07
        sha256 = "sha256-cTTr//Izrmzu5SXkJEmNWiNMvVjLlt+e+/btiBmF8w4=";
      };
    }
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

    " let g:user_emmet_install_global = 0
    " autocmd FileType html,css,scss,javascript.jsx,typescriptreact EmmetInstall
  '';

  # # Map your custom color schemes
  # xdg.configFile."nvim/colors".source = ./path/to/your/conf/vim/colors;
  # # Map your spelling files
  # xdg.configFile."nvim/spell".source = ./path/to/your/conf/vim/spell;

  # # If you still use classic Vim alongside Neovim:
  # home.file.".vim/colors".source = ./path/to/your/conf/vim/colors;
  # home.file.".vim/spell".source = ./path/to/your/conf/vim/spell;
  # home.file.".vim/keymap".source = ./path/to/your/conf/vim/keymap;

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
