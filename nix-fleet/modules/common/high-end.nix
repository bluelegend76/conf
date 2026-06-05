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

  #@ environment.systemPackages = with pkgs; [
  #@   appimage-run
  #@ ];

  # Configuration: fcitx5-configtool
  ## i18n.inputMethod = {
  ##   enable = true;
  ##   type = "fcitx5";
  ##   fcitx5.addons = with pkgs; [
  ##     fcitx5-gtk             # Support for GTK apps
  ##     fcitx5-mozc            # Japanese (if you need it)
  ##     fcitx5-rime            # Great for Chinese or custom tables
  ##     fcitx5-lua             # Useful for scripting your own inputs
  ##     # TODO/IDEA: USE FOR MATHEMATICAL (ETC) INPUT
  ##     fcitx5-m17n          # Essential for many "smaller" or historical languages
  ##   ];
  ## };

  programs.nushell = {
    enable = true;
    # Optional: If you want to keep your environment variables in sync
    # across shells, we can use a tool called 'nix-your-shell'
  };

  # TODO: WARP-TERMINAL (AND/OR GHOSTTY) {{{
  # environment.systemPackages = [
  #   pkgs.warp-terminal
  # ];
  #
  # # Warp relies on the system's font and graphics libraries
  # # We ensure those are well-linked:
  # fonts.packages = with pkgs; [ jetbrains-mono ];
  # }}}

  home.packages = with pkgs; [
    # Wayland Screenshotting
    # TODO may want to use 'spectacle -bnf' instead
    grim 
    slurp
    # TODO: ADD KDE-CONNECT + ANDROID-TOOLS
    audacity

    imagemagick
    (tesseract.override {
      enableLanguages = [ "eng" "swe" ];
    })
    parallel

    appimage-run

    xonsh
    # (xonsh.withPackages (ps: with ps; [ 
    #   # Add any Python libraries you want available in your shell here
    #   # requests 
    # ]))

    kdePackages.umbrello
    carapace  # Adds completion for Nushell


    (writeShellScriptBin "mscore4" ''
      ${appimage-run}/bin/appimage-run /home/bluelegend/Downloads/MuseScore-Studio-4.6.5.253511702-x86_64.AppImage
    '')

    # Kde Connect (or maybe use on frugal too)
    # Heavy Apps
    # okular
    ## environment.systemPackages = [
    (pkgs.symlinkJoin {
      name = "nyxt-wrapped";
      paths = [ pkgs.nyxt ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/nyxt \
          --set WEBKIT_DISABLE_COMPOSITING_MODE "1" \
          --set GDK_BACKEND "x11"
      '';
    })
    ## ];
    logseq
    anki
    (discord.override {
      withVencord = true;
    })
    signal-desktop
    libreoffice-fresh
    jetbrains.rider
    # jetbrains.idea-oss
      # jetbrains.idea
    # jetbrains.clion
    # jetbrains.pycharm -oss
    # jetbrains.webstorm
    qpwgraph

    (sbcl.withPackages (ps: with ps; [
      alexandria
      cl-json
      slynk
      # Old Note: Install CL Hyperspec
      # (ql:quickload "cl-hyperspec")
    ]))

    # sbclPackages.hyperspec
  ];
}
