{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "Pre-Release-unstable-2025-11-29";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "c84ecda30a7bdf52cb4eaef416b7901533b9329f";
    hash = "sha256-bGDGhi9poELypaun9oTyYV4xt2fnUYxr6YmitCwLgzk=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
