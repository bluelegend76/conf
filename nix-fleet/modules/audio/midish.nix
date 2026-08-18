{ pkgs, ... }:

let
  midish = pkgs.stdenv.mkDerivation rec {
    pname = "midish";
    version = "1.0.4"; # check github.com/ratchov/midish releases for latest tag
    src = pkgs.fetchFromGitHub {
      owner = "ratchov";
      repo = "midish";
      rev = version;
      sha256 = "";
    };
    buildInputs = with pkgs; [ alsa-lib alsa-lib.dev ];
    installPhase = ''
      mkdir -p $out/bin
      cp midish $out/bin/
    '';
  };
in
{ home.packages = [ midish ]; }
