{
  description = "Nix repo for calculator programs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  nixConfig = {
    # Adapted From: https://github.com/divnix/digga/blob/main/examples/devos/flake.nix#L4
    extra-substituters = "https://cache.nixos.org https://ce-programs.cachix.org";
    extra-trusted-public-keys = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= ce-programs.cachix.org-1:ZwW4booZjjGMYrr2uic5LFAo+TpMybhcfI/WrmKohiw=";
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
          devShells.default = legacyPackages.buildCEProgram {
            name = "nix-shell";
            src = null;
          };
          formatter = pkgs.nixfmt-rfc-style;
          legacyPackages = import ./pkgs { nixpkgs = pkgs; };
          checks.default = pkgs.linkFarm "all-nix-calculators" (
            (map (name: {
              inherit name;
              path = legacyPackages.CEPrograms.${name}.overrideAttrs { meta.unfree = false; };
            }) (builtins.attrNames (pkgs.lib.filterAttrs (_: x: !x.meta.broken) legacyPackages.CEPrograms)))
            ++ (map
              (name: {
                inherit name;
                path = legacyPackages.${name};
              })
              [
                "convbin"
                "convfont"
                "convimg"
                "llvm-ez80"
                "ce-toolchain"
                "ce-toolchain-stable"
                "ce-libs"
                "ce-libs-stable"
                "tivars"
                "puzpy"
                "gcc4ti"
              ]
            )
          );
        }
      )
    // {

      templates = {
        hello-world = {
          path = ./templates/hello-world;
          description = "A simple Hello World program";
        };
        default = {
          path = ./templates/bare-bones;
          description = "Add flakes to an existing program";
        };
      };
    };
}
