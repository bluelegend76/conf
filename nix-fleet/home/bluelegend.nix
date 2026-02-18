{ pkgs, config, inputs, ... }: {
  home.stateVersion = "25.11";

  # TODO: CREATE SYMLINKS FOR HOME TOWARDS EXTERNAL USB-DRIVE
  # home.file."at-data".source = config.lib.file.mkOutOfStoreSymlink "/run/media/bluelegend/MY_USB/at-data";
  # Add .vim
# EXTHD1='3a7592f8-41d6-4c29-b6d0-53533881b86a'
# ln -s /run/media/bluelegend/${EXTHD1}/legacy/dropboxlegacy_pre2021/ dropbox-legacy
# ln -s /run/media/bluelegend/${EXTHD1}/Empire/
# ln -s /run/media/bluelegend/${EXTHD1}/legacy/
# ln -s /run/media/bluelegend/${EXTHD1}/SyncThing

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
    age.keyFile = "/home/bluelegend/.config/sops/age/keys.txt";
    secrets = {
      # This tells Nix to create the SSH key file from the vault
      ssh_private_key = {
        path = "/home/bluelegend/.ssh/id_ed25519";
        mode = "0600";
      };
      # Just creating the secret for use in Git/Scripts
      git_email = {
        path = "/home/bluelegend/.config/sops/git_email";
      };
    };
  };

  home.sessionPath = [
    "$HOME/conf/at"
    "$HOME/conf/at/init"
  ];

  home.sessionVariables = {
    EDITOR = "gvim -f";
    VISUAL = "gvim -f";
    GIT_AUTHOR_EMAIL = "$(cat /home/bluelegend/.config/sops/git_email)";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      fleet-up = "sudo nixos-rebuild switch --flake ~/conf/nix-fleet#high-end";
      e = "emacsclient -c -a 'emacs'"; 
    };
    initExtra = ''
      if [ -f /home/bluelegend/.config/sops/git_email ]; then
        export GIT_AUTHOR_EMAIL=$(cat /home/bluelegend/.config/sops/git_email)
        export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
      fi

      if [ -f /home/bluelegend/.config/sops/git_name ]; then
        export GIT_AUTHOR_NAME=$(cat /home/bluelegend/.config/sops/git_name)
        export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
      fi

      # The "Heavy-Tools-on-Demand" Engine
      eval "$(direnv hook bash)"
    '';
  };

  # This part goes outside the programs.bash block, but inside your home-manager config
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

}
