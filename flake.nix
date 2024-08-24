{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in 
      {
        nixosConfigurations.alfred = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
          ];
        };

        # Install helloworld package
        packages.hello = pkgs.hello;

        # In the dev shell, reference the hello package we just installed
        # also install cowsay from nixpkgs
        devShell = pkgs.mkShell {
          buildInputs = [ self.packages.hello pkgs.cowsay];
        };
      }
    );
}