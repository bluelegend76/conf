{ pkgs, ... }: {
  home.packages = with pkgs; [
    scrot # X11 Screenshots
    # We can add more lightweight alternatives here later
  ];
}
