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
    rev = "49d6e29bec45916a25c08b9cdeed59d2cbf93d66";
    hash = "sha256-+h3a6OyP0WEWNuu7XE0sHttlP3+3anGPlcz1hz1s3Mo=";
  };
  toolchain = ce-toolchain.overrideAttrs {
    version = "khicas";
    src = fetchFromGitHub {
      owner = "CE-Programming";
      repo = "toolchain";
      rev = "f92e4d0a12da1e7b7ced3c7dbba0e5d9727b8add";
      fetchSubmodules = true;
      hash = "sha256-AASOc+EO9HFdR7EUWLNI1+SJsxayJu1eJxA4yGxmPlU=";
    };
    prePatch = ''
      cp ${khicasSrc + "/allocator_standard.c"} src/libc
      sed --in-place '/library.*LDLIBS/d' src/makefile.mk
    '';
  };
  mkDerivation = buildCEProgram.override { ce-toolchain = toolchain; };
in
mkDerivation {
  pname = "khicas";
  version = "0-unstable-2025-03-02";
  src = khicasSrc;
  patchPhase = ''
    chmod +w -R ..
    rm reloc shared
    mkdir -p shared/ti
    patchShebangs $(find -executable -type f)
    sed 's/^\/bin\///' --in-place $(find -executable -type f)
    sed 's/~\//\/build\/source\//' --in-place $(find -executable -maxdepth 1 -type f)
    sed --in-place '/bundle84/d' mkappen
    sed --in-place 's/\-i\.\.\/arTIfiCE\.8xv //' bundle84
  '';
  preInstall = ''
    rm -rf shared
  '';
  postInstall = ''
    cp install* $out
  '';
  buildPhase = ''
    ./mkappen
  '';
  nativeBuildInputs = [ python3 ];
}
