{ pkgs, ... }: {

  # TODO: VIRTUALIZATION {{{
  # # Enable virtualization
  # virtualisation.libvirtd = {
  #   enable = true;
  #   # Enables UEFI support (required for modern Windows/macOS guests)
  #   qemu.ovmf.enable = true;
  #   qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
  # };
  #
  # # The "Dashboard": GUI to manage WMs
  # programs.virt-manager.enable = true;
  # 
  # # Add yourself to the group to manage VMs without sudo
  # users.users.bluelegend.extraGroups = [ "libvirtd" ];
  # }}}

  programs.nushell = {
    enable = true;
    # Optional: If you want to keep your environment variables in sync
    # across shells, we can use a tool called 'nix-your-shell'
  };

  # TODO: WARK-TERMINAL (AND/OR GHOSTTY) {{{
  # environment.systemPackages = [
  #   pkgs.warp-terminal
  # ];
  #
  # # Warp relies on the system's font and graphics libraries
  # # We ensure those are well-linked:
  # fonts.packages = with pkgs; [ jetbrains-mono ];
  # }}}

  home.packages = with pkgs; [
    # Wayland Screenshots
    grim 
    slurp
    # TODO: ADD KDE-CONNECT + ANDROID-TOOLS

    xonsh
    # (xonsh.withPackages (ps: with ps; [ 
    #   # Add any Python libraries you want available in your shell here
    #   # requests 
    # ]))

    carapace  # Adds completion for Nushell

    # Kde Connect (or maybe use on frugal too)
    # Heavy Apps
    # okular
    nyxt
    logseq
    vesktop
    signal-desktop
    libreoffice-fresh
    jetbrains.rider
    # jetbrains.clion
    # jetbrains.pycharm-oss
    # jetbrains.idea-oss
    # jetbrains.webstorm
    qpwgraph

    sbcl
    # Install CL Hyperspec
    # (ql:quickload "cl-hyperspec")
  ];
}
