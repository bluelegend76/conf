############################################################
# PART 1 — goes in flake.nix (top-level, not home.nix)
############################################################
#
# Add the overlay input, then wire it into nixpkgs so that
# `pkgs.vscode-marketplace.<publisher>.<extension>` resolves
# to the live VS Code Marketplace, including extensions that
# aren't packaged in nixpkgs proper (SuperCollider's aren't).
#
# {
#   inputs = {
#     nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
#     home-manager.url = "github:nix-community/home-manager";
#     nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
#   };
#
#   outputs = { self, nixpkgs, home-manager, nix-vscode-extensions, ... }@inputs:
#   let
#     system = "x86_64-linux"; # adjust if needed
#     pkgs = import nixpkgs {
#       inherit system;
#       overlays = [ nix-vscode-extensions.overlays.default ];
#       config.allowUnfree = true; # some marketplace extensions require this
#     };
#   in {
#     nixosConfigurations.yourhost = nixpkgs.lib.nixosSystem {
#       inherit system;
#       modules = [
#         ./configuration.nix
#         home-manager.nixosModules.home-manager
#         {
#           home-manager.useGlobalPkgs = true;
#           home-manager.useUserPackages = true;
#           home-manager.users.yourusername = import ./home.nix;
#           home-manager.extraSpecialArgs = { inherit inputs; };
#         }
#       ];
#     };
#   };
# }

############################################################
# PART 2 — goes in home.nix (imported as your Home Manager module)
############################################################
{ pkgs, ... }:

{
  # Make sure the SuperCollider audio engine itself is present —
  # the VS Code extension is only a client; it talks to sclang/scsynth.
  home.packages = [ pkgs.supercollider ];

  programs.vscode = {
    enable = true;
    # package = pkgs.vscode; # default; swap for pkgs.vscodium if you prefer

    profiles.default = {

      # --- ported from your existing settings.json ---------------
      # (dropped "config-path" — not a real VS Code setting, was a
      #  personal note-to-self and did nothing functionally)
      userSettings = {
        "workbench.colorTheme" = "Default High Contrast";
        "vim.leader" = ",";
        "vim.incsearch" = true;
        "editor.stickyScroll.maxLineCount" = 1;
        "editor.stickyScroll.enabled" = false;
        "editor.minimap.enabled" = false;
        "editor.acceptSuggestionOnCommitCharacter" = false;
        "git.autofetch" = true;
        "php.debug.executablePath" = ""; # delete this line if you no longer do PHP
        "window.zoomLevel" = 1;
        "editor.codeActionsOnSave" = { };

        "vim.insertModeKeyBindings" = [
          { before = [ "<leader>" "j" ]; after = [ "<Esc>" ]; }
          { before = [ "<leader>" "." ]; after = [ ":update" ]; }
        ];
        "vim.normalModeKeyBindingsNonRecursive" = [
          { before = [ "H" ]; after = [ "0" ]; }
          { before = [ "L" ]; after = [ "$" ]; }
          { before = [ "g" "g" ]; after = [ "g" ";" ]; }
          { before = [ "Q" ]; after = [ "@" "@" ]; }
        ];

        # --- new: SuperCollider extension wiring --------------------
        # Point the extension at the Nix-store sclang explicitly —
        # PATH-based auto-detection is less reliable on NixOS.
        "supercollider.sclang.cmd" = "${pkgs.supercollider}/bin/sclang";
      };

      # --- extensions -------------------------------------------
      extensions = with pkgs.vscode-marketplace; [
        vscodevim.vim
        ScottCarver.vscode-supercollider
        # Fallback if scztt's extension gives you friction:
        # rogervila.supercollider-vscode
      ];
    };
  };
}

############################################################
# PART 3 — one manual, non-Nix step (can't be declared away)
############################################################
#
# On first use, inside VS Code with an .scd file open, run the
# command palette action:
#   "SuperCollider: Update LanguageServer.quark"
# (or, from the legacy SC IDE: Quarks.install("https://github.com/scztt/LanguageServer.quark"))
#
# This installs SC-side tooling the extension depends on for
# autocomplete/introspection. It lives in your SC user config dir,
# not in the Nix store, so it survives rebuilds but isn't
# reproducible via this file — just a one-time setup step per machine.
