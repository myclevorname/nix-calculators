{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-09-06";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "241d400064b1e7e2870f5bf84323c423c16ad676";
    hash = "sha256-0J14FCCCQyTuDTe3hIDJhfSQve+pMTldYmYx+d/3/uw=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
