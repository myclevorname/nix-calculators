{
  description = "Nix repo for calculator programs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      self,
      flake-utils,
    }@inputs:
    flake-utils.lib.eachSystem
      [
        "x86_64-linux"
        "x86_64-darwin"
      ]
      (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        rec {
          formatter = pkgs.nixfmt-rfc-style;
          legacyPackages = pkgs.callPackage ./pkgs { packages = self.legacyPackages.${system}; };
          checks.default = pkgs.linkFarm "all-nix-calculators" (
            (map (name: {
              inherit name;
              path = legacyPackages.CEPrograms.${name};
            }) (builtins.attrNames legacyPackages.CEPrograms))
            ++ (map
              (name: {
                inherit name;
                path = legacyPackages.${name};
              })
              [
                "convbin"
                "llvm-ez80"
                "ce-toolchain"
                "ce-toolchain-stable"
                "ce-libs"
                "ce-libs-stable"
              ]
            )
          );
        }
      );
}
