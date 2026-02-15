{ pkgs, ... }: {
  # We use the pgtk (Pure GTK) version for best Wayland support
  home.packages = with pkgs; [
    (emacs30-pgtk.override {
      withTreeSitter = true;
      withNativeCompilation = true;
    })
    # Required for some Emacs packages
    ripgrep
    fd
  ];

  # This starts the Emacs server in the background
  services.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;
  };
}
