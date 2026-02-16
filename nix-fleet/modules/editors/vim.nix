{ pkgs, lib, config, ... }:
let
  # Detect presence of ARM-based mobile-device
  isMobile = pkgs.stdenv.hostPlatform.isAarch64;
in {
  # Environment Variables (Paths & Editor)
  home.sessionVariables = {
    # The "Universal Path" logic
    SYNC_BASE = if isMobile
                then "/storage/emulated/0/SyncThing"
                else "${config.home.homeDirectory}/SyncThing";

    # Use gvim as default editor in the terminal
    EDITOR = "gvim -f";
    VISUAL = "gvim -f";
  };

  programs.neovim = {
    enable = true;
    # false means using classic Vim in terminal-session
    vimAlias = true;
    viAlias = true;
    # setting to true might conflict with "gvim -f"
    defaultEditor = false;
    ## extraConfig = builtins.readFile "${config.home.homeDirectory}/conf/vim/.vimrc";
    extraConfig = builtins.readFile ../../vim/.vimrc;
  };

  programs.vim = {
    enable = true;
    # Read plus inject existing .vimrc-file into Nix-configuration
    extraConfig = builtins.readFile ../../vim/.vimrc;
  };

  # plugins = with pkgs.vimPlugins; [
  #   # We can add Nix-managed plugins here later
  #   vim-nix
  #   nord-vim
  # ];

  # Ensure GVim and NeoVide are available
  home.packages = with pkgs; [
    vim-full
  ] ++ lib.optionals (!isMobile) [
    neovide  # Use NeoVide only on non-mobile devices
  ];

}
