{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-09-24";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "66cae3c87cd992ea1fd42ec23df53bfa82f596de";
    hash = "sha256-cHRorCDMsqWx0GNXi/De+lFH/HAz0cDLFCeuddoOF1o=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
