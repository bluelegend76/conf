{ pkgs, ... }: {
  home.stateVersion = "25.11";

  imports = [
    ../modules/common/universal.nix
    ../modules/common/high-end.nix
    ../modules/editors/vim.nix
    ../modules/editors/emacs.nix
    ../modules/desktop/wayland-wm.nix
    ../modules/services/sync.nix
  ];

  home.sessionPath = [
    "$HOME/conf/at"
    "$HOME/conf/at/init"
  ];

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
}
