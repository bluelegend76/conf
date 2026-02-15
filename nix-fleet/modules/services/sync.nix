{ pkgs, ... }: {
  # The Cloud Engine (Dropbox/Gdrive)
  home.packages = [ pkgs.insync ];

  # The Peer-to-Peer Engine
  services.syncthing = {
    enable = true;
    tray.enable = true; 
  };
}
