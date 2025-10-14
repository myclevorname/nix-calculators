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
  version = "2.0-unstable-2025-10-14";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "CEmu";
    rev = "e2405ac8ea8664067be69d9f1985d03137365e84";
    hash = "sha256-eryFHeFQVyJ2Lev/eZgVJv3gvOodbwhGRbGn6x4uMU4=";
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
