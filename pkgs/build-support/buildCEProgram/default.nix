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
  env ? { },
  dontConvimg ? false,
  ...
}@inputs:
stdenv.mkDerivation (
  inputs
  // {
    CEDEV = ce-toolchain;
    buildPhase =
      if buildPhase != null then
        buildPhase
      else
        ''
          runHook preBuild
          ${if dontConvimg then "" else "make gfx $makeFlags"}
          make $makeFlags
          runHook postBuild
        '';
    enableParallelBuilding = true;
    installPhase =
      if installPhase != null then
        installPhase
      else
        ''
          runHook preInstall
          mkdir -p $out/
          cp $(find -name "*.8x*") $out/
          cp README* readme* license* LICENSE* LISEZMOI* lisezmoi* $out || true
          runHook postInstall
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
