{ nixpkgs }:
(nixpkgs.extend (
  final: prev:
  let
    ce-programs =
      (import ./build-support final.pkgs)
      // (import ./utilities final.pkgs)
      // (
        let
          getDirs =
            x:
            map (m: ./ce-programs/. + "/${m}") (
              builtins.attrNames (builtins.readDir (builtins.filterSource (path: type: type == "directory") x))
            );
        in
        rec {
          CEPrograms =
            (builtins.listToAttrs (
              map (path: {
                name = builtins.baseNameOf path;
                value = final.callPackage path { };
              }) (getDirs ./ce-programs)
            ))
            // {
              khicas-en = CEPrograms.khicas.override { language = "en"; };
              khicas-fr = CEPrograms.khicas.override { language = "fr"; };
              khicas-l2 = CEPrograms.khicas.override { language = "l2"; };
            };
        }
      );
  in
  {
    inherit ce-programs;
    prevPkgs = prev;
  }
  // ce-programs
)).ce-programs
