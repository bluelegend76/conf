{ pkgs, ... }: {
  home.stateVersion = "25.11";
  imports = [ ../modules/editors/emacs.nix ../modules/desktop/wayland-wm.nix ];

  home.sessionPath = [ "$HOME/conf/at" "$HOME/conf/at/init" ];

  home.sessionVariables = {
    EDITOR = "gvim -f";
    VISUAL = "gvim -f";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      fleet-up = "sudo nixos-rebuild switch --flake ~/conf/nix-fleet#high-end";
      e = "emacsclient -c -a 'emacs'"; 
    };
  };

  home.packages = with pkgs; [
    keepassxc signal-desktop vesktop vlc mpv qpwgraph
    libreoffice-fresh gimp jetbrains.rider audacious pavucontrol
  ];
}
