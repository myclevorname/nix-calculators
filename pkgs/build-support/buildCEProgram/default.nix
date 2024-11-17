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
          cp *.8x* */*.8x* */*/*.8x* */*/*/*.8x* $out/
          cp README* readme* license* LICENSE* LISEZMOI* lisezmoi* $out
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
