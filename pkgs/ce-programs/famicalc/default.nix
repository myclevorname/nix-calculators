{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "Pre-Release-unstable-2025-11-10";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "48e334f6f309dce7cfd71626b235d1dee44f2447";
    hash = "sha256-FEKNoJB9Lx8K1qhx+gcruBa3JDiGwOgKV+2rvV6u5+o=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
