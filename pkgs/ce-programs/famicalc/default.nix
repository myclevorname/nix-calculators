{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-01-19";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "c0cb2954a65fbee681566adfcfd7d315023eb736";
    hash = "sha256-SX3LHdoIc70ityvtPhdoPBJMHy1BVbxLsvLAjnyC8iA=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
