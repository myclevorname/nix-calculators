{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "Pre-Release-unstable-2025-11-09";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "2f32e5b510e27abdac7b7012c2594448a8083493";
    hash = "sha256-KdSsVwAQmp2hxtvpqf1ClSQwxZoG9doI5/GHcdrjYQU=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
