{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Wayland Screenshots
    grim 
    slurp
    
    # Heavy Apps
    # okular
    nyxt
    logseq
    vesktop
    signal-desktop
    libreoffice-fresh
    jetbrains.rider
    qpwgraph
  ];
}
