{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-09-08";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "32dae2f1686c3a78af9d96a718042e3198a9ff1b";
    hash = "sha256-uhZXt12XXTiOoA4YnGCZxKiFn62qGO1970SdG0cgRLg=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
