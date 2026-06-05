self: super: {
  yuescript = super.stdenv.mkDerivation {
    pname = "yuescript";
    version = "0.33.10";

    src = super.fetchFromGitHub {
      owner = "IppClub";
      repo = "YueScript";
      rev = "v0.33.10";
      sha256 = "sha256-nXNHvLj2CoXbuJVhQBtr+0QDCqa4Dq7hPQmxjy5TJYQ=";
    };

    buildInputs = [ super.lua5_1 ]; # Explicitly pinning to Lua 5.1

    # Add this patchPhase to fix the /bin/bash issue
    patchPhase = ''
      patchShebangs .
    '';

    # make install SHELL=${super.bash}/bin/bash LUAI=${super.lua5_1}/include LUAL=${super.lua5_1}/lib PREFIX=$out
    buildPhase = ''
      make SHELL=${super.bash}/bin/bash LUAI=${super.lua5_1}/include LUAL=${super.lua5_1}/lib
    '';
    
    # installPhase = "true";
    installPhase = ''
      mkdir -p $out/bin
      cp bin/release/yue $out/bin/yue
    '';
  };
}
