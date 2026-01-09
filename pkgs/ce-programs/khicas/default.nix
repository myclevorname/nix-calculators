{
  lib,
  buildCEProgramStable,
  fetchFromGitHub,
  python3,
  language ? null,
}:
buildCEProgramStable {
  pname = "khicas" + (if builtins.isNull language then "" else "-${language}");
  version = "nightly-unstable-2025-12-31";
  src = fetchFromGitHub {
    owner = "KhiCAS";
    repo = "ti-ce";
    rev = "5a213fefb6d335984de773c05a6596f2d70d0f1c";
    hash = "sha256-L/SoJegnsQhWotWIsOO+CuI6bM++mDaz18pACsmUn/Q=";
    fetchSubmodules = true;
  };
  patchPhase = ''
    rm -rf shared
    mkdir -p shared/ti
    mv app_tools/INST.8xp shared/ti
    patchShebangs $(find -executable -type f)
    sed --in-place 's/\-i\.\.\/arTIfiCE\.8xv //' bundle*
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
    broken = true;
    # License specified in install_en.txt
    # Includes uSTL under the MIT license
    license = with lib.licenses; [
      gpl2
      mit
    ];
  };
}
