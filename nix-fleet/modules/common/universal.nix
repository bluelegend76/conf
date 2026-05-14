{ pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # sops-block duplicate? {{{
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
  # }}}

  # TODO: MIGHT BE BETTER TO MOVE TO home/bluelegend.nix LATER ON
  home.packages = with pkgs; [
    sops age
    thunar pavucontrol keepassxc
    evince ristretto img2pdf
    # pdftk
    vlc mpv audacious
    yt-dlp yewtube
    tree htop ripgrep fd  # fd: modern faster 'find'
    soundtouch poppler-utils  # e.g. pdftotext
    translate-shell
    ffmpeg
    # soundstretch
    img2pdf  # convert images to pdf
    qpdf     # or pdfmixup
    # librsvg =convert svg to pdf (with rsvg-convert)
    # ghostscript =convert ps to pdf (with ps2pdf)
    gimp
    inkscape
    tuxguitar
    lilypond
    freesweep
    # fceux (+More/Extra emulators)
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
    # Note: Mail handled by Sops

    settings = {
      user.name = "Daniel Albertsson";

      # This is the "Safety Rail" for SSH
      url."git@github.com:".insteadOf = "https://github.com/";

      # This locks in your preferred branch name
      init.defaultBranch = "main";
    };
  };
}
