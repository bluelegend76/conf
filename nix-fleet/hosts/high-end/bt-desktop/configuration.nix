{ config, pkgs, ... }: {
  imports = [
    ./bt-hardware.nix
    ../../../modules/services/guix-bridge.nix
  ];

  boot.kernelModules = ["snd-seq" "snd-rawmidi" ];

  # System essentials (Boot, Net, Time)
  boot.loader.grub = { enable = true; device = "/dev/sda"; useOSProber = true; };
  networking.hostName = "high-end";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";

  # Desktop Environment
  services.xserver.enable = true;
  services.displayManager.sddm = { enable = true; wayland.enable = true; };
  services.desktopManager.plasma6.enable = true;
  services.xserver.windowManager.icewm.enable = true;
  # services.xserver.windowManager.fluxbox.enable = true;
  services.xserver.xkb = { layout = "se"; variant = "dvorak"; };
  console.keyMap = "sv-latin1";

  # Hardware & Drivers
  hardware.bluetooth.enable = true;
  hardware.graphics = { enable = true; enable32Bit = true; };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = false;  # Not included in original conf; = May want to take out later on
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";   # Best compression ratio
    memoryPercent = 50;   # Can use up to 50% of your RAM as a compressed "overflow"
  };

  # 'JetBrains / Unpatched Binary Support'
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    fuse3
    icu
    nss
    openssl
    curl
    expat
    libxml2
    libsecret
  ];

  # Set flag to 1 if wanting to use 'rr' with gdb
  # boot.kernel.sysctl."kernel.perf_event_paranoid" = 1;
  boot.kernel.sysctl."kernel.perf_event_paranoid" = 0;
  # Tip: Set to -1 for getting maximum profiling-data

  musnix = {
    enable = true;
    # Real-time kernel is optional. If you want the lowest latency 
    # for Ardour, uncomment the next line. Warning: This will trigger a kernel rebuild!
    # kernel.realtime = true; 
    
    # Optimizes system for audio (RT priorities, etc.)
    rtcqs.enable = true; 

    ## Legacy/Implicated: soundcardPrio = 95;
    # This enables the 'rtirq' service, which prioritizes the IRQs 
    # of your soundcards specifically.
    rtirq.enable = true;
  };

  # Ensure your user is in the audio group (Required by musnix)
  # users.users.bluelegend.extraGroups = [ "audio" ];
  # +TODO: Possibly add video-group as well

  # System-wide Services & Programs
  services.pipewire = { 
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # Allows Qsynth to communicate directly
    #  with audio-hardware with low latency
    jack.enable = true;
    wireplumber.enable = true;
  };

  # EXTRA FIXES for the 'WARNING' list:
  services.udev.extraRules = ''
    # Grant audio group access to CPU DMA latency for Ardour/Reaper
    KERNEL=="cpu_dma_latency", GROUP="audio", MODE="0660"
  '';
  
  # FIX: The "Preempt RT" & Threaded IRQs warning
  # You don't necessarily need a full Real-time kernel yet, 
  # but "threadirqs" helps immensely with internal soundcard stability.
  boot.kernelParams = [ "threadirqs" ];

  services.guix.enable = true;

  services.openssh.enable = true;
  programs.steam = {
    enable = true;
    # Open ports in the firewall for Steam Remote Play
    remotePlay.openFirewall = true;
    # Open ports in the firewall for Source Dedicated Server
    dedicatedServer.openFirewall = true;
  };

  # TODO: Perhaps move up to sound/music/rt-block(!)
  security.rtkit.enable = true; # Necessary for Pipewire/Musnix handshake

  programs.firefox.enable = true;
  # TODO: ADD STANDARD FIREFOX-INSTALLATION {{{
  # programs.firefox = {
  #   enable = true;
  #   
  #   profiles.default = {
  #     id = 0;
  #     name = "default";
  #     isDefault = true;

  #     # 1. Search Engine Preference
  #     search = {
  #       force = true;
  #       default = "DuckDuckGo";
  #       order = [ "DuckDuckGo" "Google" ];
  #     };

  #     # 2. Extensions (Using standard IDs)
  #     # Note: Nix will download these from the Mozilla Add-ons store
  #     extensions = with pkgs.nur.repos.rycee.firefox-addons; [
  #       ublock-origin
  #       darkreader
  #       vimium-c
  #     ];

  #     # 3. Custom 'about:config' tweaks for a "High-End" experience
  #     settings = {
  #       "browser.startup.homepage" = "https://duckduckgo.com";
  #       "browser.newtabpage.enabled" = false; # Clean new tab
  #       "extensions.pocket.enabled" = false;  # No Pocket clutter
  #       "browser.topsites.contile.enabled" = false; # No sponsored shortcuts
  #       "browser.formfill.enable" = false;    # Don't save form data (privacy)
  #     };
  #   };
  # };
  # }}}

  nixpkgs.config.allowUnfree = true;

  # In your NixOS configuration.nix
  nixpkgs.overlays = [
    (import ../../../overlays/yuescript.nix)
  ];

  # Essential for the Tuf's performance
  ## programs.gamemode.enable = true;

  # Only keep essential SYSTEM tools here
  environment.systemPackages = with pkgs; [
    fluxbox
    vim-full gitFull wget curl htop tree tailscale syncthing
    jq yq
    ugrep # agrep ack ag
    mc
    gh # the GitHub CLI
    sqlite sqlitebrowser
    # lua51Packages.yuescript
    yuescript

    config.boot.kernelPackages.perf

    muse-sounds-manager  # TODO: Move to High-End

    (pkgs.weechat.override {
      configure = { availablePlugins, ... }: {
        plugins = with availablePlugins; [
          guile  # This is the magic word
          python
          lua
          # ... other plugins
        ];
      };
    })
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
    # comment out for first version
    package = pkgs.appimage-run.override {
      # helpful for audio-apps
      extraPkgs = pkgs: [pkgs.libjack2 pkgs.alsa-lib ];
    };
  };

  users.users.bluelegend = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
  };

  users.users.testuser = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    password = "test";
  };

  system.stateVersion = "25.11";
  swapDevices = [ { device = "/var/lib/swapfile"; size = 16384; } ];
}
