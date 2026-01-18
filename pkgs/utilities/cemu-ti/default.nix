{
  stdenv,
  lib,
  fetchFromGitHub,
  fetchpatch,
  cmake,
  pkg-config,
  qt6,
  libarchive,
  libpng,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "CEmu";
  version = "2.0-unstable-2026-01-18";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "CEmu";
    rev = "5330ab740be974321d704aa6c6e16005b33a78e5";
    hash = "sha256-XWDinszsFCP4RtiYilzq9U2OPuMBaYy/oCC3s5IjL+w=";
    fetchSubmodules = true;
  };

  sourceRoot = "${finalAttrs.src.name}/gui/qt/";

  nativeBuildInputs = [
    cmake
    qt6.wrapQtAppsHook
    pkg-config
  ];

  buildInputs = [
    qt6.qtbase
    libarchive
    libpng
  ];

  meta = with lib; {
    description = "Third-party TI-84 Plus CE / TI-83 Premium CE emulator, focused on developer features";
    mainProgram = "CEmu";
    homepage = "https://ce-programming.github.io/CEmu";
    license = licenses.gpl3Plus;
  };
})
