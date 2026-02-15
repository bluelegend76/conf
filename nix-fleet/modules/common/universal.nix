{ pkgs, ... }: {
  home.packages = with pkgs; [
    evince
    ristretto
    thunar
    mpv
    vlc
    audacious
    pavucontrol
    keepassxc
    yt-dlp
    htop
    tree
    translate-shell
    ripgrep
    fd
    gimp
    # insync
  ];

  # The Git-aware prompt you were likely using
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Daniel Albertsson";
    userEmail = "trulystrange@gmail.com";
  };
}
