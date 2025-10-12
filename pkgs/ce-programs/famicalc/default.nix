{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-10-12";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "0ce609a2a6db9080b5827a4dee8f044db49e857d";
    hash = "sha256-vTrGcOihN7jL8HxiOvQoyBqeuzU5pbXWXF61AvslT+I=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
