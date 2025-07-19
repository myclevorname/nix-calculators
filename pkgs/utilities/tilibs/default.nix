{
  lib,
  fetchFromGitHub,
  callPackage,
  darwin,
}:

let
  inherit (callPackage ./libticonv.nix { }) src version;
in
{
  libticonv = callPackage ./libticonv.nix { };
  libticalcs2 = callPackage ./libticalcs2.nix {
    inherit src version;
    inherit (darwin) libobjc;
  };
  libtifiles2 = callPackage ./libtifiles2.nix { inherit src version; };
  libticables2 = callPackage ./libticables2.nix { inherit src version; };
}
