{
  buildCEProgram,
  fetchFromGitHub,
  python3,
  language ? null,
}:
buildCEProgram {
  pname = "khicas" + (if builtins.isNull language then "" else "-${language}");
  version = "nightly-unstable-2025-05-03";
  src = fetchFromGitHub {
    owner = "KhiCAS";
    repo = "ti-ce";
    rev = "f40e897ea3ba1947dd2e3b990c655205bf85cd33";
    hash = "sha256-VqLCg+4NAjy/0m7/nZRCjohtX3tLKFa/e2p0ba8Hvn8=";
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
  meta.broken = true;
}
