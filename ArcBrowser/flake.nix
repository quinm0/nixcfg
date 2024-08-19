{
  description = "A Nix flake to download and run Arc Browser using Wine on Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    
    pkgs = import nixpkgs {
      inherit system;
    };

    # Download the binary
    arcSetup = pkgs.fetchurl {
      url = "https://releases.arc.net/windows/ArcInstaller.exe";
      sha256 = "23a8a97766cc91004a6ffa0413d9a8bc7f732e4a402ee1f30119c6f0980a3ba9"; 
    };

    andale32 = pkgs.fetchurl {
      url = "https://web.archive.org/web/20231025215926/https://raw.githubusercontent.com/pushcx/corefonts/master/andale32.exe";
      sha256 = "0524fe42951adc3a7eb870e32f0920313c71f170c859b5f770d82b4ee111e970";
    };
  in
  {
    defaultPackage.${system} = pkgs.stdenv.mkDerivation {
       name = "arc-browser";

      # Skip the unpack phase since it's a .exe file
      unpackPhase = "true";

      nativeBuildInputs = [ pkgs.wine pkgs.winetricks pkgs.makeWrapper ];

      installPhase = ''
        mkdir -p $out/bin
        mkdir -p $out/wineprefix
        mkdir -p $out/home
        mkdir -p $out/winetricks_cache

        # Set HOME and WINEPREFIX to directories within the build environment
        export HOME=$out/home
        export WINEPREFIX=$out/wineprefix
        export WINETRICKS_CACHE=$out/winetricks_cache

        # Copy the andale32.exe file to the winetricks cache
        mkdir -p $WINETRICKS_CACHE/corefonts
        cp ${andale32} $WINETRICKS_CACHE/corefonts/andale32.exe

        # Initialize Wine and install necessary components
        wineboot --init

        # Copy the Arc Browser setup executable
        cp ${arcSetup} $out/bin/arc-browser-setup.exe
        chmod +x $out/bin/arc-browser-setup.exe
      '';

      # Create a wrapper script to run the .exe with Wine
      postInstall = ''
        makeWrapper ${pkgs.wine}/bin/wine $out/bin/arc-browser \
          --prefix WINEPREFIX : $out/wineprefix --set HOME $out/home --add-flags "$out/bin/arc-browser-setup.exe"
      '';

      meta = with pkgs.lib; {
        description = "Arc Browser wrapped with Wine";
        license = licenses.unfree;
      };
    };

    devShell.${system} = pkgs.mkShell {
      buildInputs = [ pkgs.wine pkgs.makeWrapper pkgs.winetricks ];
    };
  };
}
