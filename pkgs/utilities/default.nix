pkgs:
let
  inherit (pkgs) callPackage;
in
{
  ti80emu = callPackage ./ti80emu { };
}
