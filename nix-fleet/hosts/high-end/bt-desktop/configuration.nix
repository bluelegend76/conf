{ config, pkgs, ... }: {
  imports = [ ./bt-hardware.nix ];

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
  };

  # System-wide Services & Programs
  services.pipewire = { 
    enable = true; alsa.enable = true; alsa.support32Bit = true; 
    pulse.enable = true; jack.enable = true; 
  };
  services.guix.enable = true;
  services.openssh.enable = true;
  programs.steam.enable = true;
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Only keep essential SYSTEM tools here
  environment.systemPackages = with pkgs; [
    vim-full gitFull wget curl htop tree stow tailscale syncthing
  ];

  users.users.bluelegend = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = "25.11";
  swapDevices = [ { device = "/var/lib/swapfile"; size = 16384; } ];
}
