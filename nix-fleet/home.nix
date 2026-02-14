{ pkgs, ... }: {
  home.stateVersion = "25.11"; 

  # Setting up the path and environment variables
  home.sessionVariables = {
    EDITOR = "gvim -f";
    VISUAL = "gvim -f";
    GVIM_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      fleet-up = "sudo nixos-rebuild switch --flake ~/conf/nix-fleet#high-end";
    };
  };

  # We pull these out of the system profile and into your user profile
  home.packages = with pkgs; [
    keepassxc
    signal-desktop
    vesktop
    vlc
    mpv
    qpwgraph
  ];
}
