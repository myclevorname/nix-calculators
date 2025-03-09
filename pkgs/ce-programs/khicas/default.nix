{
  buildCEProgram,
  fetchFromGitHub,
  python3,
  language ? null,
}:
buildCEProgram {
  pname = "khicas" + (if builtins.isNull language then "" else "-${language}");
  version = "0-unstable-2025-03-09";
  src = fetchFromGitHub {
    owner = "KhiCAS";
    repo = "ti-ce";
    rev = "c27cdc322b0bbafa2a5ab3514f642e41643b7f95";
    hash = "sha256-wqUpA0qHeVsDtxL/wE8eYQAdK9pNETgVzI7/AlJN6ys=";
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
