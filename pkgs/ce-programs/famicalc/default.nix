{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
}:
buildCEProgramStable {
  pname = "famicalc";
  version = "Pre-Release-unstable-2026-01-08";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "5254b7559c7ca768960a8bb23827d5b811bf02b2";
    hash = "sha256-Nfp3lwWf3qCyYaMA9O7GunayHP6bqT6PsNg8JCLKbKA=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
