{
  buildCEProgram,
  fetchFromGitHub,
  python3,
  language ? null,
}:
buildCEProgram {
  pname = "khicas" + (if builtins.isNull language then "" else "-${language}");
  version = "0-unstable-2025-03-08";
  src = fetchFromGitHub {
    owner = "KhiCAS";
    repo = "ti-ce";
    rev = "600a69049fc34649aa81732afde554d548621a90";
    hash = "sha256-wnZOWFyGjb5EeU4MFp5K405VGN0w+4olR2ZZMdxv5S8=";
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
