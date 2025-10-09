{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-10-09";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "21f9259d297caa60d120fcd4889e07b47eb5ea86";
    hash = "sha256-qtvHTtiDTXzyWMw0VRUXkOq/vgxBJ8pO1gjMOL5je30=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
