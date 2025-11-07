{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "Pre-Release-unstable-2025-11-03";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "4ed8926e73d6f0508460a505f41c64a3b4ff8a62";
    hash = "sha256-1k1DxiivLAYV6qO5HtTN+zQRB7pzAxvoXfgcTPzkFEs=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
