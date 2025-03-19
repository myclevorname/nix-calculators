{
  buildCEProgram,
  fetchFromGitHub,
  python3,
  language ? null,
}:
buildCEProgram {
  pname = "khicas" + (if builtins.isNull language then "" else "-${language}");
  version = "0-unstable-2025-03-19";
  src = fetchFromGitHub {
    owner = "KhiCAS";
    repo = "ti-ce";
    rev = "f14cad6057e8ed7dc4357fe532f19ba091e2318c";
    hash = "sha256-LnZ0wMbsIllajGln919WOqDMVvax/RKt1z03hHsNPPc=";
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
}
