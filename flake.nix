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
        devShells = {
          default = legacyPackages.buildCEProgram {
            name = "nix-shell";
            src = null;
          };
          stable = legacyPackages.buildCEProgramStable {
            name = "nix-shell";
            src = null;
          };
        };
        formatter = pkgs.nixfmt-tree;
        legacyPackages = import ./pkgs { inherit pkgs; };
        checks =
          let
            all =
              (map (
                name:
                legacyPackages.CEPrograms.${name}.overrideAttrs (
                  final: prev: {
                    meta = prev.meta // {
                      license = [ ];
                    };
                  }
                )
              ) (builtins.attrNames legacyPackages.CEPrograms))
              ++ (map (name: legacyPackages.${name}) [
                "binutils-z80"
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
              ]);
            isBroken = x: x.meta.broken or false;
          in
          {
            test-broken = pkgs.linkFarm "broken-programs" (
              map (package: {
                name = if package ? pname then package.pname else package.name;
                path = pkgs.testers.testBuildFailure (
                  package.overrideAttrs (
                    final: prev: {
                      meta = prev.meta // {
                        broken = false;
                      };
                    }
                  )
                );
              }) (builtins.filter isBroken all)
            );
            default = pkgs.linkFarm "all" (
              map (package: {
                name = if package ? pname then package.pname else package.name;
                path = package;
              }) (builtins.filter (x: !(isBroken x)) all)
            );
          };
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
