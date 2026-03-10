{ pkgs, ... }: {
  home.sessionVariables = {
    GVIM_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    GBM_BACKEND = "nvidia-drm"; # Specific to your Black Tower's Nvidia card
  };

  # Plasma/KDE Timeout-settings {{{
  # This targets the KDE Power Management settings directly
  # home.file.".config/powermanagementprofilesrc".text = ''
  #   [AC][Suspend]
  #   idleTime=-1
  #   # -1 usually means "Never" in KDE's config logic

  #   [AC][ScreenBrightness]
  #   idleTime=-1
  #   
  #   [AC][DimDisplay]
  #   idleTime=-1
  # '';
  # }}}
}
