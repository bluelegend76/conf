{ pkgs, inputs, pkgs, ... }: {
  home.stateVersion = "25.11";

  imports = [
    ../modules/common/universal.nix
    ../modules/common/high-end.nix
    ../modules/editors/vim.nix
    ../modules/editors/emacs.nix
    ../modules/desktop/wayland-wm.nix
    ../modules/services/sync.nix
    inputs.sops-nix.homeManagerModules.sops
  ];

  # 2. ADD THE SOPS CONFIGURATION
  sops = {
    # Point to the vault (relative to this file)
    defaultSopsFile = ../secrets/secrets.yaml;
    
    # Point to your physical Age key
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    
    secrets = {
      # This tells Nix to create the SSH key file from the vault
      ssh_private_key = {
        path = "${config.home.homeDirectory}/.ssh/id_ed25519";
        mode = "0600";
      };
      # Just creating the secret for use in Git/Scripts
      git_email = {};
    };
  };

  home.sessionPath = [
    "$HOME/conf/at"
    "$HOME/conf/at/init"
  ];

  home.sessionVariables = {
    EDITOR = "gvim -f";
    VISUAL = "gvim -f";
    GIT_AUTHOR_EMAIL = config.sops.placeholder.git_email;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      fleet-up = "sudo nixos-rebuild switch --flake ~/conf/nix-fleet#high-end";
      e = "emacsclient -c -a 'emacs'"; 
    };
  };
}
