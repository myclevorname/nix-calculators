{ nixpkgs }:
(nixpkgs.extend (
  final: prev:
  let
    ce-programs =
      (import ./build-support final.pkgs)
      // (
        let
          getDirs =
            x:
            map (m: ./ce-programs/. + "/${m}") (
              builtins.attrNames (builtins.readDir (builtins.filterSource (path: type: type == "directory") x))
            );
        in
        {
          CEPrograms = builtins.listToAttrs (
            map (path: {
              name = builtins.baseNameOf path;
              value = final.callPackage path { };
            }) (getDirs ./ce-programs)
          );
        }
      );
  in
  {
    inherit ce-programs;
    prevPkgs = prev;
  }
  // ce-programs
)).ce-programs
