{ pkgs, ... }: {

  # TODO: ENABLE VIRTUALIZATION
  # # Enable virtualization
  # virtualisation.libvirtd.enable = true;
  # programs.virt-manager.enable = true;
  #
  # # Add yourself to the group to manage VMs without sudo
  # users.users.bluelegend.extraGroups = [ "libvirtd" ];

  home.packages = with pkgs; [
    # Wayland Screenshots
    grim 
    slurp
    
    # Kde Connect (or maybe use on frugal too)
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
    # Install CL Hyperspec
    # (ql:quickload "cl-hyperspec")
  ];
}
