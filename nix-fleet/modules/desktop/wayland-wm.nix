{ pkgs, ... }: {
  home.sessionVariables = {
    GVIM_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    GBM_BACKEND = "nvidia-drm"; # Specific to your Black Tower's Nvidia card
  };
}
