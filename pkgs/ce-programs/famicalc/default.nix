{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-08-23";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "5672da5e84d721c33d09b64620ba5cc9af098bbc";
    hash = "sha256-mRZT4E0sZuzFADfe6FnVDTLGH4AWJTBu7SGmgZitGPc=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
