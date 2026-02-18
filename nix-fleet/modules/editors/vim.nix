{ pkgs, lib, config, ... }:
let
  # Detect presence of ARM-based mobile-device
  isMobile = pkgs.stdenv.hostPlatform.isAarch64;
  # The "Universal Path" logic
  syncPath = if isMobile
             then "/storage/emulated/0/SyncThing"
             else "${config.home.homeDirectory}/SyncThing";
in {
  # Environment Variables (Paths & Editor)
  home.sessionVariables = {
    # The "Universal Path" logic
    SYNC_BASE = syncPath;
    # Use gvim as default editor in the terminal
    EDITOR = "gvim -f";
    VISUAL = "gvim -f";
  };

  # This ensures that even if 'home.sessionVariables' fails to source,
  # the variable is hard-coded into your shell profile.
  programs.bash = {
    enable = true;
    initExtra = ''
      export SYNC_BASE="${syncPath}"
    '';
  };

  programs.neovim = {
    enable = true;
    # false means using classic Vim in terminal-session
    vimAlias = true;
    viAlias = true;
    # setting to true might conflict with "gvim -f"
    defaultEditor = false;
      # extraConfig = builtins.readFile "${config.home.homeDirectory}/conf/.vimrc";
      # extraConfig = builtins.readFile ../../../.vimrc;
    extraConfig = "source ~/.vimrc";
  };

  programs.vim = {
    enable = true;
    ## FIXME: package = pkgs.vim-full;

    # # Read plus inject existing .vimrc-file into Nix-configuration
    # extraConfig = builtins.readFile ../../../.vimrc;
    plugins = with pkgs.vimPlugins; [
      # We can add Nix-managed plugins here later
      # vim-nix
      # nord-vim
      vim-sensible
      vim-polyglot
      vim-matchup
      fzf-vim
      vim-vinegar
      vim-surround
      # "translate-shell-vim"
      # srcery-vim
      vim-json
      vim-commentary
      rainbow_csv
      tabular
      vim-easy-align
      vim-hy
      vim-fugitive
      vim-gitgutter
    ];

    extraConfig = ''
        ${builtins.readFile ./vimrc-core.vim}
    '';
  };


  # Ensure GVim and NeoVide are available
  home.packages = with pkgs; [
    ## FIXME: vim-full
    (lib.hiPrio vim-full)

    qrencode
    imagemagick
    firefox
    mpv
    evince
    ristretto
    thunar
    translate-shell
    # Temporary addition to make NeoVim understand current .vimrc
    # pkgs.vimPlugins.vim-plug
  ] ++ lib.optionals (!isMobile) [
    neovide  # Use NeoVide only on non-mobile devices
  ];
}
