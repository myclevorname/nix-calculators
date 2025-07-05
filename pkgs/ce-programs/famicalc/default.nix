{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-06-20";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "9672061bbf1dc2a519fba2bb19e81a5160afc3c4";
    hash = "sha256-z8Qbld523//48HyNu+taqBEj4hYW1a3SxZg/gZnc7Ec=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
