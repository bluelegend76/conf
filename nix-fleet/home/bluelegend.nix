{ pkgs, config, inputs, ... }: {
  home.stateVersion = "25.11";

# TODO: CREATE SYMLINKS FOR HOME TOWARDS EXTERNAL USB-DRIVE
# let
#   extHd1 = "3a7592f8-41d6-4c29-b6d0-53533881b86a";
# in {
#   home.file."dropbox-legacy".source = config.lib.file.mkOutOfStoreSymlink "/run/media/bluelegend/${extHd1}/legacy/dropboxlegacy_pre2021";
#   home.file."Empire".source = config.lib.file.mkOutOfStoreSymlink "/run/media/bluelegend/${extHd1}/Empire";
#   home.file."legacy".source = config.lib.file.mkOutOfStoreSymlink "/run/media/bluelegend/${extHd1}/legacy";
# }

  imports = [
    ../modules/common/universal.nix
    ../modules/common/high-end.nix
    ../modules/editors/vim.nix
    ../modules/editors/emacs.nix
    ../modules/editors/vscode.nix
    ../modules/desktop/wayland-wm.nix
    ../modules/services/sync.nix
    # ../modules/audio/midish.nix
    #   ~/SyncThing/rsc/tmpl/ngix/hask-euterp/
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
      gmail_app_password = {
        path = "/home/bluelegend/.config/sops/gmail_app_password";
      };
    };
  };

  home.sessionPath = [
    "$HOME/conf/at"
    "$HOME/conf/rsync-custom"
    "$HOME/conf/at/init"
    "$HOME/conf/at/utils/"
  ];

  home.sessionVariables = {
    EDITOR = "gvim -f";
    VISUAL = "gvim -f";
    GIT_AUTHOR_EMAIL = "$(cat /home/bluelegend/.config/sops/git_email)";
    # This points your shell to the systemd-managed agent
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent.socket";

    # --- THE GUIX LOCALE FIX ---
    # This tells Guix where to find its locale data so it stops complaining
    GUIX_LOCPATH = "$HOME/.guix-home/profile/lib/locale";
  };

  # programs.bash = {
  #   enable = true;
  #   # setupShellForLogin = false;

  #   shellAliases = {
  #     fleet-up = "sudo nixos-rebuild switch --flake ~/conf/nix-fleet#high-end && ~/conf/nix-fleet/scripts/guix-sync.sh";
  #     e = "emacsclient -c -a 'emacs'";
  #     # ding = "mpv /home/bluelegend/Dropbox/rsc/media/au/sfx/ding.sfx.mp3 &";
  #     ding = "mpv /home/bluelegend/Dropbox/rsc/media/au/sfx/ding.sfx.mp3 > /dev/null 2>&1 &";
  #     au = "mpv --no-video --term-osd-bar";
  #   };
  #   # initExtra = ''
  #   #   # --- RESTORE THE NIX FOUNDATION ---
  #   #   if [ -f "/etc/profiles/per-user/bluelegend/etc/profile.d/hm-session-vars.sh" ]; then
  #   #     . "/etc/profiles/per-user/bluelegend/etc/profile.d/hm-session-vars.sh"
  #   #   fi

  #   #   if [ -f /home/bluelegend/.config/sops/git_email ]; then
  #   #     export GIT_AUTHOR_EMAIL=$(cat /home/bluelegend/.config/sops/git_email)
  #   #     export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
  #   #   fi

  #   #   if [ -f /home/bluelegend/.config/sops/git_name ]; then
  #   #     export GIT_AUTHOR_NAME=$(cat /home/bluelegend/.config/sops/git_name)
  #   #     export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
  #   #   fi

  #   #   # The "Heavy-Tools-on-Demand" Engine
  #   #   eval "$(direnv hook bash)"
  #   # '';
  # };

  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
      };

      "github.com" = {
        hostname = "github.com";
        user = "git";
        ## identityFile = "~/.ssh/id_ed25519";
        # identityFile = "/run/user/1000/secrets.d/71/ssh_private_key";
        # Permanent fix for relative path
        identityFile = "~/.config/sops-nix/secrets/ssh_private_key";
      };
    };
  };

  programs.mu.enable = true;
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;

  accounts.email = {
    maildirBasePath = "Maildir";

    accounts."gmail" = {
      primary = true;
      address = "trulystrange@gmail.com";
      userName = "trulystrange@gmail.com";
      realName = "Daniel Albertsson";

      passwordCommand = "cat /home/bluelegend/.config/sops/gmail_app_password";

      imap = {
        host = "imap.gmail.com";
        port = 993;
        tls.enable = true;
      };

      mbsync = {
        enable = true;
        create = "maildir";
        expunge = "both";
        remove = "both";
        patterns = [
          "*"
          "![Gmail]*"
          "[Gmail]/Sent Mail"
          "[Gmail]/All Mail"
          "[Gmail]/Trash"
          "[Gmail]/Drafts"
        ];
      };

      smtp = {
        host = "smtp.gmail.com";
        port = 587;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };

      msmtp.enable = true;  # ← correct: no 'programs.' prefix inside accounts block
    };
  };

  services.mbsync = {
    enable = true;
    frequency = "*:0/10";  # every 10 minutes
    postExec = "${pkgs.mu}/bin/mu index";
  };

  # This part goes outside the programs.bash block, but inside your home-manager config
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    stdlib = ''
      use_guix() {
        # 1. Environment Loading
        if [[ -f manifest.scm ]]; then
          echo "🌐 Lattice: Loading project manifest..."
          eval "$(guix shell --manifest=manifest.scm --search-paths)"
        else
          # If no manifest, we only load what's explicitly asked for in the .envrc
          # e.g., 'use guix python'
          if [[ $# -gt 0 ]]; then
            echo "🌐 Lattice: Loading ad-hoc environment: $*"
            eval "$(guix shell "$@" nss-certs --search-paths)"
          fi
        fi

        # 2. Universal SSL Bridge (Safe for all languages)
        if [[ -n "$GUIX_ENVIRONMENT" ]]; then
          export SSL_CERT_FILE="$GUIX_ENVIRONMENT/etc/ssl/certs/ca-certificates.crt"
          export GIT_SSL_CAINFO="$SSL_CERT_FILE"
        fi

        # 3. Smart Pathing (Only adds what exists)
        [[ -d node_modules/.bin ]] && PATH_add node_modules/.bin
        [[ -d .venv/bin ]] && PATH_add .venv/bin
        [[ -d bin ]] && PATH_add bin
      }
    '';
  };

  # home.file.".profile" = {
  #   text = ''
  #     # Source Guix if it exists
  #     if [ -f "$HOME/.guix-home/profile/etc/profile" ]; then
  #       . "$HOME/.guix-home/profile/etc/profile"
  #     fi

  #     # 1. THE NIX FOUNDATION
  #     # if [ -f "/etc/profiles/per-user/bluelegend/etc/profile.d/hm-session-vars.sh" ]; then
  #     #   . "/etc/profiles/per-user/bluelegend/etc/profile.d/hm-session-vars.sh"
  #     # fi

  #     # 3. EXTRA PATHS (Fallback manual check)
  #     # export PATH="$HOME/conf/at:$HOME/conf/rsync-custom:$HOME/conf/at/init:$HOME/conf/at/utils/:$PATH"
  #   '';
  #   force = true;
  # };

}
