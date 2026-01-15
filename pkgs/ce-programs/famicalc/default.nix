{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
}:
buildCEProgramStable {
  pname = "famicalc";
  version = "Pre-Release-unstable-2026-01-15";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "bf2a68a2e6c69c804c4582296a841a2482852c5a";
    hash = "sha256-dmPnUk5LbJWvFBmEKGl3FAcrzBh+rBa2hhWmMUTO1as=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
