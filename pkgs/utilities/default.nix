pkgs:
let
  inherit (pkgs) callPackage;
in
{
  ti80emu = callPackage ./ti80emu { };
  cemu-ti = callPackage ./cemu-ti { };
  tilibs = callPackage ./tilibs { };
  tilp2 = callPackage ./tilp2 { };
}
