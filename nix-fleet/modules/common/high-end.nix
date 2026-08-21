{ pkgs, lib, ... }:

let
  # Builds a colon-separated search path for a given plugin format (e.g.
  # "vst3", "clap", "lv2"), pointing at the standard locations Nix-installed
  # plugins actually land in, plus a per-user dotdir fallback for anything
  # installed by hand or by a non-Nix installer. Needed so Carla (and any
  # other plugin host) can actually discover surge-XT/dexed/helm below.
  makePluginPath = format:
    (lib.makeSearchPath format [
      "$HOME/.nix-profile/lib"
      "/run/current-system/sw/lib"
      "/etc/profiles/per-user/$USER/lib"
    ]) + ":$HOME/.${format}";
in
{

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

  home.sessionVariables = {
    VST3_PATH = makePluginPath "vst3";
    CLAP_PATH = makePluginPath "clap";
    LV2_PATH  = makePluginPath "lv2";
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

  # Carla has been known to ignore a configured path if there isn't also a
  # literal ~/.vst3, ~/.clap, etc. directory present on disk. These are
  # harmless empty fallbacks that also give a manual drop-in spot for any
  # plugin installed outside Nix.
  home.file.".vst3/.keep".text = "";
  home.file.".clap/.keep".text = "";
  home.file.".lv2/.keep".text = "";

  home.packages = with pkgs; [
    # Wayland Screenshotting
    # TODO may want to use 'spectacle -bnf' instead
    grim
    slurp
    wev
    kdePackages.kdeconnect-kde
    audacity

    # Music-related global installs
    # perhaps: Ardour, 
    # 
    # Carla is wrapped so it can reliably find PipeWire's JACK-compatible
    # library (pipewire.jack) even though it's not a standalone top-level
    # nixpkgs attribute -- see the NixOS wiki's JACK page. In practice Carla
    # may already connect to JACK fine without this (likely because
    # services.pipewire.jack.enable already exposes it system-wide), but
    # this makes it explicit and robust regardless of session/environment.
    (pkgs.symlinkJoin {
      name = "carla-wrapped";
      paths = [ pkgs.carla ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/carla \
          --prefix LD_LIBRARY_PATH : "${pkgs.pipewire.jack}/lib"
      '';
    })
    # yoshimi - fork of zynaddsubfx
    surge-XT dexed helm
    puredata

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


    # TODO: Might want to change root-location to /home/bluelegend/.local/bin/
    (writeShellScriptBin "mscore4" ''
      ${appimage-run}/bin/appimage-run /home/bluelegend/Downloads/MuseScore-Studio-4.6.5.253511702-x86_64.AppImage
    '')

    openmw
    # portmod  # Installing third-party mods/plugins for OpenMW

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

    vscode

    (discord.override {
      withVencord = true;
    })
    signal-desktop

    libreoffice-fresh
    jetbrains.rider
    # jetbrains.idea-oss
      # jetbrains.idea
    # jetbrains.clion
    # jetbrains.pycharm
    # -oss
    # jetbrains.webstorm
    qpwgraph
    jack2

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
