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

    sbcl
    # cl-hyperspec
    # FIXME: Handle Slime with Emacs instead
    # sbclPackages.quicklisp-starter
    # sbclPackages.quicklisp-slime-helper
    # sbclPackages.hyperspec
  ];
}
