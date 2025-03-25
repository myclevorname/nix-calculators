{
  buildCEProgram,
  fetchFromGitHub,
  python3,
  language ? null,
}:
buildCEProgram {
  pname = "khicas" + (if builtins.isNull language then "" else "-${language}");
  version = "0-unstable-2025-03-24";
  src = fetchFromGitHub {
    owner = "KhiCAS";
    repo = "ti-ce";
    rev = "4f9d3625a94436f0e3a47b676024f32a677dcf49";
    hash = "sha256-eqZin0IdGnTL5VJG0HMKDkO8SBU9xc4fI4F2x0MKxVw=";
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
}
