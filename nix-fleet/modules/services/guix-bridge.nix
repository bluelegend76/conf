{ config, pkgs, lib, ... }:

let
  # We use a relative path from THIS file to find the guix-home folder
  # Adjust the number of '../' based on where you save this file
  guixHomeDir = ../../guix-home; 
  entryPoint = "${guixHomeDir}/home-config.scm";
in
{
  systemd.services.guix-home-sync = {
    description = "Sync Guix Home with nix-fleet repository";
    after = [ "network.target" "guix-daemon.service" ];
    requires = [ "guix-daemon.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      User = "bluelegend"; 
      RemainAfterExit = true;
      ExecStart = "${pkgs.bash}/bin/bash -lc 'guix home reconfigure ${entryPoint}'";
    };

    # This ensures that whenever you run nixos-rebuild, 
    # it checks if your Guix Scheme files have changed.
    restartTriggers = [ 
      (builtins.path { path = guixHomeDir; name = "guix-home-source"; }) 
    ];
  };
}
