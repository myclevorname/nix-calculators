{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "Pre-Release-unstable-2025-12-30";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "1a42bbe926e8c2462b8ef4905cd08c48bfb516d1";
    hash = "sha256-c+iUocztIdVGmkCpLWha0V7r0owNRqHEcI/GrPUpCWg=";
  };
  meta = {
    broken = true;
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
