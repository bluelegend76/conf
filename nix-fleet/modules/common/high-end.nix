{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Wayland Screenshots
    grim 
    slurp
    
    # Heavy Apps
    vesktop
    signal-desktop
    libreoffice-fresh
    jetbrains.rider
    qpwgraph
  ];
}
