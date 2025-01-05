{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-01-05";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "7308a0cac5df9a8aabdfc43964e136e7025eeb5d";
    hash = "sha256-LKsIb/tIfXmptiFYGvuNyAM/J06c7ZvH1ObSM7Vz1XM=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
