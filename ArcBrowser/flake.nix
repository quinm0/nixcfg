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
  in
  {
    defaultPackage.${system} = pkgs.stdenv.mkDerivation {
      name = "arc-browser";

      # Skip the unpack phase since it's a .exe file
      unpackPhase = "true";

      # Download the binary
      src = pkgs.fetchurl {
        url = "https://releases.arc.net/windows/ArcInstaller.exe"; # Replace with the actual URL
        sha256 = "23a8a97766cc91004a6ffa0413d9a8bc7f732e4a402ee1f30119c6f0980a3ba9";  # Replace with the actual hash
      };

      nativeBuildInputs = [ pkgs.wine ];

      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/arc-browser-setup.exe
        chmod +x $out/bin/arc-browser-setup.exe
      '';

      # Since we are creating an executable wrapper, we should point to the setup file directly
      buildInputs = [ pkgs.makeWrapper ];

      postInstall = ''
        makeWrapper ${pkgs.wine}/bin/wine $out/bin/arc-browser --prefix WINEPREFIX : "$HOME/.wine" --add-flags "$out/bin/arc-browser-setup.exe"
      '';

      meta = with pkgs.lib; {
        description = "Arc Browser wrapped with Wine";
        license = licenses.unfree;
      };
    };

    devShell.${system} = pkgs.mkShell {
      buildInputs = [ pkgs.wine ];
    };
  };
}
