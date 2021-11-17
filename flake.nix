{
  description = "A very basic flake";

  inputs = {
    mach-nix = { url = "github:DavHau/mach-nix?tag=3.3.0"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, mach-nix, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: rec {
      packages.kobodl = mach-nix.lib.${system}.mkPython {
        requirements = ''
        kobodl
        '';
      };
      defaultPackage = packages.kobodl;
    });
}
