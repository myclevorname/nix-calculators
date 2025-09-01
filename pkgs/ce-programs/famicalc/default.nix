{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-08-31";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "33c512c3f4761cbc0f3c4478f43d92c61dac3479";
    hash = "sha256-Asao4KGo3H/X2HaihlB4hmAJWMN1nLGt4+L9KBhC3wQ=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
