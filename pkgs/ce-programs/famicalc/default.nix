{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-10-24";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "9f353ff7537fe3899f5d5dc8b24ceeac712a87b7";
    hash = "sha256-7NQKzabpXGeQkp8KHEsfi+YwLe7iLhOOXLz2S6WyIWM=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
