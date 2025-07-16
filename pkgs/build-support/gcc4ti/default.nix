{
  fetchFromGitHub,
  gcc13Stdenv,
  lib,
  makeWrapper,
}:

gcc13Stdenv.mkDerivation (finalAttrs: {
  pname = "gcc4ti";
  version = "0-unstable-2025-03-14";
  src = fetchFromGitHub {
    owner = "debrouxl";
    repo = "gcc4ti";
    rev = "4cb128b04a3776b5889ba700428957d87de80601";
    hash = "sha256-yIP6Oo3Fmtye9B4v5vuskkKwCZCGqg01ZBeuFuWy0yo=";
  };
  nativeBuildInputs = [ makeWrapper ];
  sourceRoot = finalAttrs.src.name + "/trunk/tigcc-linux";
  patchPhase = ''
    runHook prePatch
    chmod +w --recursive /build/${finalAttrs.src.name}
    runHook postPatch
  '';
  hardeningDisable = [ "format" ];
  configurePhase = ''
    runHook preConfigure
    cd scripts
    ./updatesrc
    ./package_src
    cd ..
    runHook postConfigure
  '';
  buildPhase = ''
    runHook preBuild
    cd gcc4ti-0.96b11
    echo -e "$out" | ./scripts/Install
    cd ../
    runHook postBuild
  '';
  preFixup = ''
    rm -r $out/doc
  '';
  fixupPhase = ''
    runHook preFixup
    for i in $(ls $out/bin);
    do
      wrapProgram $out/bin/$i --set TIGCC $out
    done
    runHook postFixup
  '';

  meta = {
    license = with lib.licenses; [ gpl2 ];
  };
})
