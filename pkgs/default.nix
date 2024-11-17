{ callPackage, packages }:
(callPackage ./build-support { inherit packages; })
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
        value = callPackage path packages;
      }) (getDirs ./ce-programs)
    );
  }
)
