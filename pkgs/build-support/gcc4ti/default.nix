{
  fetchFromGitHub,
  gcc13Stdenv,
  lib,
  makeWrapper,
}:

gcc13Stdenv.mkDerivation (finalAttrs: {
  pname = "gcc4ti";
  version = "0-unstable-2020-10-07";
  src = fetchFromGitHub {
    owner = "debrouxl";
    repo = "gcc4ti";
    rev = "30c611b1287b4d6b0296102dcab9ef593778a6c2";
    hash = "sha256-VrEg2HtVTkgJaN69ECcFEFDodnV077KLDN5iz+O+neU=";
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
  fixupPhase = ''
    runHook preFixup
    for i in $(ls $out/bin);
    do
      wrapProgram $out/bin/$i --set TIGCC $out
    done
    runHook postFixup
  '';
})
