{ pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # environment.systemPackages = [
  #   pkgs.sops
  #   pkgs.age
  # ];

  # imports = [
  #   inputs.sops-nix.homeManagerModules.sops
  # ];
  #
  # sops = {
  #   # Path to your private age key
  #   age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  #   
  #   # The file we just created
  #   defaultSopsFile = ./secrets/secrets.yaml;
  #   
  #   # This automatically symlinks the decrypted secret to a path Nix can use
  #   secrets.test_secret = {};
  #   secrets.git_email = {};
  # };

  # TODO: MIGHT BE BETTER TO MOVE TO home/bluelegend.nix LATER ON
  home.packages = with pkgs; [
    sops
    age
    evince
    ristretto
    # pdftk
    img2pdf
    thunar
    mpv
    vlc
    tuxguitar
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

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true; # Makes it lightning-fast for Nix-flakes
    enableBashIntegration = true;
  };

  # The Git-aware prompt you were likely using
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  # TODO: MIGHT BE BETTER TO MOVE TO home/bluelegend.nix LATER ON
  programs.git = {
    enable = true;
    settings.user.name = "Daniel Albertsson";
    # Note: Handled by Sops instead ====
    ## userEmail = "trulystrange@gmail.com";
    ## settings.user.email = "trulystrange@gmail.com";
  };
}
