{
  buildCEProgram,
  ce-toolchain,
  fetchFromGitHub,
  lib,
  python3,
}:
let
  khicasSrc = fetchFromGitHub {
    owner = "KhiCAS";
    repo = "ti-ce";
    rev = "fd196ad1ec0a0c313d476318f50da29758bcb58f";
    hash = "sha256-KZ8k3dnXB5GVEIw+H3OAAa0QdxOSSYHRZn45sp6rjYY=";
  };
  toolchain = ce-toolchain.overrideAttrs {
    prePatch = ''
      cp ${khicasSrc + "/allocator_standard.c"} src/libc
    '';
  };
  mkDerivation = buildCEProgram.override { ce-toolchain = toolchain; };
in
mkDerivation {
  pname = "khicas";
  version = "0-unstable-2025-03-06";
  src = khicasSrc;
  patchPhase = ''
    rm -rf shared
    mkdir -p shared/ti
    mv app_tools/INST.8xp shared/ti
    patchShebangs $(find -executable -type f)
    sed --in-place 's/\-i\.\.\/arTIfiCE\.8xv //' bundle84
  '';
  preInstall = ''
    mv shared/ti/app/khicas*.b8* .
    rm -rf shared/ti/app
  '';
  postInstall = ''
    cp install* $out
  '';
  buildPhase = ''
    ./mkappen
  '';
  nativeBuildInputs = [ python3 ];
}
