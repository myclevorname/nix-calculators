{
  stdenv,
  ce-toolchain,
  convbin,
  convimg,
  fasmg,
  lib,
  llvm-ez80,
  convfont,
}:
{
  buildPhase ? null,
  enableParallelBuilding ? true,
  nativeBuildInputs ? [ ],
  installPhase ? null,
  ...
}@inputs:
stdenv.mkDerivation (
  inputs
  // {
    buildPhase =
      if buildPhase != null then
        buildPhase
      else
        ''
          runHook preBuild
          make gfx $makeFlags || true
          (make obj/icon.src $makeFlags ; make obj/lto.src $makeFlags) || make $makeFlags
          runHook postBuild
        '';
    enableParallelBuilding = true;
    installPhase = ''
      for i in **/*.src **/*.asm **/*.inc **/*.c **/*.h **/*.cpp **/*.hpp *akefile*; do mkdir -p $out/$(dirname $i); cp $i $out/$(dirname $i); done
    '';
    nativeBuildInputs = nativeBuildInputs ++ [
      ce-toolchain
      convbin
      convimg
      convfont
      llvm-ez80
      fasmg
    ];
  }
)
