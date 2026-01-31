{
  lib,
  buildCEProgramStable,
  fetchFromGitHub,
  python3,
  language ? null,
}:
buildCEProgramStable {
  pname = "khicas" + (if builtins.isNull language then "" else "-${language}");
  version = "nightly-unstable-2026-01-31";
  src = fetchFromGitHub {
    owner = "KhiCAS";
    repo = "ti-ce";
    rev = "c0ed8b5ea9c11a2c584ef804ca87d93d3deb4cf4";
    hash = "sha256-SB4w+OlbbGMZNn0c3priS2QyJUrt1t9hNDGfXoqeRRE=";
    fetchSubmodules = true;
  };
  patchPhase = ''
    rm -rf shared
    mkdir -p shared/ti
    mv app_tools/INST.8xp shared/ti
    patchShebangs $(find -executable -type f)
    sed --in-place 's/\-i \.\.\/arTIfiCE\.8xp //' bundle
  '';
  preInstall = ''
    mv shared/ti/app/*.b8* .
    rm -rf shared/ti/app
  '';
  postInstall = ''
    cp install* *.b8* $out
    cp khicas.b8* shared/ti/DEMO.8ek $out/khicas.8ek
  '';
  buildPhase = ''
    ./mkapp${if builtins.isNull language then "en" else language}
  '';
  nativeBuildInputs = [ python3 ];
  meta = {
    # License specified in install_en.txt
    # Includes uSTL under the MIT license
    license = with lib.licenses; [
      gpl2
      mit
    ];
  };
}
