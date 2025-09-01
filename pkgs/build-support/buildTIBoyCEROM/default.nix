{ tiboyce, stdenv, ... }:
{
  src,
  name ? builtins.baseNameOf src,
  namePrefix,
  meta ? { },
}:
# romFile is the file you want to convert
let
  builder = stdenv.mkDerivation {
    name = "tiboyce-romgen";
    src = tiboyce.src + "/tiboyce-romgen";
    enableParallelBuilding = true;
    installPhase = ''
      mkdir -p $out/bin
      cp tiboyce-romgen $out/bin
    '';
  };
in
stdenv.mkDerivation {
  name = "tiboyce-rom";
  nativeBuildInputs = [ builder ];
  src = src;
  dontUnpack = true;
  buildPhase = ''
    tiboyce-romgen -t "${name}" $src ${namePrefix}
  '';
  installPhase = ''
    mkdir -p $out
    cp *.8xv $out
  '';
  inherit meta;
}
