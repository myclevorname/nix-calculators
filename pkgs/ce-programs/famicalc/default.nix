{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-10-26";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "27ad41df811bc65dc426766f4e20f70718618fc5";
    hash = "sha256-MeVtrrNTUBoxLw4q0MoqJodneVDAgP3NVTTMcPvOyIs=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
