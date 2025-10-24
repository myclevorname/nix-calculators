{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-10-24";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "55cadea754120df44ca41d1f1b9cf3164cb7ca36";
    hash = "sha256-RNab8LdpNc1GyMZh4paQbQ5PZT/Lckm1CJYqzahpmC0=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
