{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
}:
buildCEProgramStable {
  pname = "famicalc";
  version = "Pre-Release-unstable-2026-01-23";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "bd5443e09ccdfa26f783ff62679d1d9e40aad3d9";
    hash = "sha256-8PKxUjP1NUb9Zdfb0eVwKnicS1/d3q7rFO06RBiTSdY=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
