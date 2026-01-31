{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
}:
buildCEProgramStable {
  pname = "famicalc";
  version = "0.2-unstable-2026-01-31";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "ec6bdbf2628e460f05e3f27b27f371fb4a165181";
    hash = "sha256-QAjgzfVwaxZEn6Bj3U8CBWQhzhiGU5/cmtv520i/8Rw=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
