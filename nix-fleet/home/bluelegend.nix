{ pkgs, ... }: {
  home.stateVersion = "25.11";

  # Import the Emacs module we're about to create
  imports = [
    ../modules/editors/emacs.nix
  ];

  # The "Persona" variables
  home.sessionVariables = {
    EDITOR = "gvim -f";
    VISUAL = "gvim -f";
    GVIM_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1"; # Critical for Wayland + Electron/Chrome
  };

  # Managed Bash & the "Fleet Control" alias
  programs.bash = {
    enable = true;
    shellAliases = {
      fleet-up = "sudo nixos-rebuild switch --flake ~/conf/nix-fleet#high-end";
      # Instant-open Emacs (requires the daemon in Step 2)
      e = "emacsclient -c -a 'emacs'"; 
    };
  };

  # User-specific packages (Moving them out of configuration.nix)
  home.packages = with pkgs; [
    keepassxc
    signal-desktop
    vesktop
    vlc
    mpv
    qpwgraph
  ];
}
