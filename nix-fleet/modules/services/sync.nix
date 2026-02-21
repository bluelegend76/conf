{ pkgs, ... }: {
  # The Peer-to-Peer Engine
  services.syncthing = {
    enable = true;
    # Silence the standalone tray pop-up for KDE
    tray.enable = false; 

    settings = {
      devices = {
        "black-tower" = { id = "ZVNJE5G-MUMMUWJ-H3U3B7T-XWJIFNO-WU6EXRO-ZZUKKRP-IWGWYE5-IKSVOAL"; };
        # "tuf-laptop" = { id = "WE-WILL-ADD-THIS-LATER"; };
        "galaxy-s24" = { id = "KD5KIWQ-GEWUGVI-WPHH4YN-NX7W2AC-UHR66IF-UTGI6U4-F2YQXFB-AS2KEQC"; };
      };

      # folders."npnyf-i4ksn" = {
      folders = {
        "npnyf-i4ksn" = {
          path = "/home/bluelegend/SyncThing";
          devices = [ "black-tower" "galaxy-s24" ];
          label = "Main SyncThing Dir";
        };
      };

      # Safety: Keep the Web-UI accessible locally without lockouts
      gui = {
        user = "";
        password = "";
      };
    };
  };

  home.packages = with pkgs; [
    syncthingtray-minimal
    insync
    # TODO dropbox
  ];
}
