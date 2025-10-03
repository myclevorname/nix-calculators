{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-10-03";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "faf2c2f0a9b25c88c9499fa1cf7b84505ceb9c33";
    hash = "sha256-69Dhf6ADDpmRl1FWnxl8py989z0eOHKnePXmtSs6aEY=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
