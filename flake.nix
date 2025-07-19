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
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      rec {
        devShells.default = legacyPackages.buildCEProgram {
          name = "nix-shell";
          src = null;
        };
        formatter = pkgs.nixfmt-tree;
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
              "ce-libs"
              "ce-libs-stable"
              "ce-toolchain"
              "ce-toolchain-stable"
              "cemu-ti"
              "convbin"
              "convfont"
              "convimg"
              "gcc4ti"
              "llvm-ez80"
              "puzpy"
              "ti80emu"
              "tilp2"
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
