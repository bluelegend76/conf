{ pkgs, ... }:

{
  home.packages = [ pkgs.supercollider ];

  programs.vscode = {
    enable = true;
    profiles.default = {
      userSettings = (builtins.fromJSON (builtins.readFile ./vscode-settings.json)) // {
        "supercollider.sclang.cmd" = "${pkgs.supercollider}/bin/sclang";
      };

      extensions = with pkgs.vscode-marketplace; [
        vscodevim.vim
        rogervila.supercollider-vscode
        chenglou92.rescript-vscode
      ];
    };
  };
}
