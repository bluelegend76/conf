{ pkgs, ... }:

let
  # A small helper for your preferred editor
  myEditor = "gvim -f"; # or "neovide --nodetach"
in
{
  # 1. Install the support tools
  home.packages = with pkgs; [ 
    lynx     # HTML rendering
    # may want to add imv / sxiv (to open/handle images)
    urlscan  # Link extraction
    libnotify # For mail notifications
  ];

  # 2. Define the Account (The core of the "1.0" system)
  accounts.email.accounts.primary = {
    primary = true;
    address = "trulystrange@gmail.com";
    realName = "Daniel Albertsson";
    userName = "trulystrange@gmail.com";
    
    # Secret Management: Use a command to fetch your password
    # This replaces the author's manual GPG sourcing
    passwordCommand = "${pkgs.password-store}/bin/pass mail/google-app-password";

    # NeoMutt Configuration
    neomutt.enable = true;
    neomutt.extraConfig = ''
      # Pulling the best Vim-like bindings from the article
      bind index j next-entry
      bind index k previous-entry
      bind pager j next-line
      bind pager k previous-line
      
      # Integration with urlscan
      macro index,pager \cb "<pipe-message> urlscan<Enter>" "extract URLs"
      
      # Sidebar tweaks
      set sidebar_visible = yes
      set sidebar_width = 25
      set sidebar_format = "%B %* [%?N?%N / ?%S]"
    '';

    # Fetching: mbsync (isync) configuration
    mbsync = {
      enable = true;
      create = "both";
      expunge = "both";
    };

    # Sending: msmtp configuration
    msmtp.enable = true;
  };

  # 3. Enable the Programs
  programs.neomutt = {
    enable = true;
    vimKeys = true;
    editor = myEditor;
    sidebar.enable = true;
    # Native notmuch integration for instant search
    notmuch.enable = true; 
  };

  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch = {
    # + May want to set up 'Virtual Folder' for searching / bind F
    enable = true;
    hooks.preNew = "mbsync --all"; # Sync mail before indexing
  };

  # 4. The Background Sync Service
  services.mbsync = {
    enable = true;
    frequency = "*-*-* *:0/15:00"; # Sync every 15 minutes
  };
}
