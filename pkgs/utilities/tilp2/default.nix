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
  version = "1.18-unstable-2026-01-25";
  src = fetchFromGitHub {
    owner = "debrouxl";
    repo = "tilp_and_gfm";
    rev = "4a399bc491b2d2d9fdab76d23d7cf87a43b0beec";
    hash = "sha256-lR++eEYSO3xcTUVNMustm6Zd4bL2mKO//M0tPDEPen0=";
  };
  sourceRoot = finalAttrs.src.name + "/tilp/trunk/";
  nativeBuildInputs = [
    cmake
    intltool
    pkg-config
  ];
  buildInputs = [
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
    mainProgram = "tilp2";
    platforms = lib.platforms.unix;
  };
})
