{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-08-26";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "e338bcf176242aa7f4ead29a4fe142b73e3e5cfd";
    hash = "sha256-wnljbav1cdhjYkYCtyacXC0V/VxVOI+nGCuauPClT8Y=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
