{
  description = "Empire Fleet - Multi-Device Infrastructure";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    musnix.url = "github:musnix/musnix";
    nix-vscode-extensions = {                                # NEW
      url = "github:nix-community/nix-vscode-extensions";    # NEW
      inputs.nixpkgs.follows = "nixpkgs";                     # NEW
    };                                                        # NEW
  };

  # outputs = { self, nixpkgs, home-manager, ... }@inputs: {
  outputs = { self, nixpkgs, home-manager, musnix, ... }@inputs: {
    nixosConfigurations.high-end = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        musnix.nixosModules.musnix
        { nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ]; }

        # Point to your existing config
        ./hosts/high-end/bt-desktop/configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.bluelegend = import ./home/bluelegend.nix;
        }
      ];
    };
  };
}
