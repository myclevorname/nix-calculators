{
  tilibs,
  stdenv,
  fetchFromGitHub,
  cmake,
  gtk2,
  intltool,
  pkg-config,
  lib,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "tilp";
  version = "1.18-unstable-2024-12-01";
  src = fetchFromGitHub {
    owner = "debrouxl";
    repo = "tilp_and_gfm";
    rev = "0a525619a07d92734b5eb5ba1d47c56f4de37458";
    hash = "sha256-itPop4GO6ty40iucg31YgHEoK0W05eM+rD9tF+nAugE=";
  };
  sourceRoot = finalAttrs.src.name + "/tilp/trunk/";
  nativeBuildInputs = [
    cmake
    intltool
    pkg-config
  ];
  buildInputs =
    [
      gtk2
    ]
    ++ (with tilibs; [
      libticonv
      libtifiles2
      libticables2
      libticalcs2
    ]);
  patches = [ ./compile.patch ];

  meta = {
    description = "TILP is a program allowing a computer to communicate with TI graphing calculators";
    homepage = "http://lpg.ticalc.org/prj_tilp";
    license = lib.licenses.gpl2Only;
    mainProgram = "tilp";
    platforms = lib.platforms.unix;
  };
})
