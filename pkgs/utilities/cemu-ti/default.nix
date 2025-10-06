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
  version = "2.0-unstable-2025-10-06";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "CEmu";
    rev = "aa5a194d7faf832116a083f1a7c2da51ffa26a15";
    hash = "sha256-USWyHXkTFo1veLCVkXs+k9Zdggmqfp/OnCU0NZhcedA=";
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
