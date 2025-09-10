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
    rev = "5270245cea248ca2e3e91401e921377c69fac927";
    hash = "sha256-b+BvtabVhb7RKbIDGc6CjApKZncNAbWRO9ODFff+sUk=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
