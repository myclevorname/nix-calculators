{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
}:
buildCEProgramStable {
  pname = "famicalc";
  version = "Pre-Release-unstable-2026-01-10";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "507a885f153102f3910a8dfdaf24307c1bc4c7a8";
    hash = "sha256-onvRR4vzT2jcuDppns8fnh7bcAEulmwO3Uk499FXeAI=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
