{
  description = "Nix repo for calculator programs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, self, flake-utils }@inputs:
   flake-utils.lib.eachSystem [ "x86_64-linux" "x86_64-darwin"  ] (system: {
      legacyPackages = nixpkgs.legacyPackages.${system}.callPackage ./pkgs
        { packages = self.legacyPackages.${system}; };
    });
}
