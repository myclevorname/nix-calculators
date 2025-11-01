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
  version = "2.0-unstable-2025-11-01";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "CEmu";
    rev = "7f94a92c39648858d860fbf9a20ad6cf968a97b0";
    hash = "sha256-/BrrND0a0dFPPBZTUj16CBhXC0AF3TQeR9Rq8hbdotA=";
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
