{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-01-08";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "bcdd6a53face8b510407166f3c8fd5a619712b40";
    hash = "sha256-r3ORfmBZ62Q5cCc5zsIFp9NLX3/VL++uHyB7MsSsf3k=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
