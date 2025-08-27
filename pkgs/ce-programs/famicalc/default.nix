{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-08-27";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "b86f1e28b2b4e2f9c19b7dde43c38da29bd9f32a";
    hash = "sha256-3Yo6SUtI5LTgD7ySgnOehKGGnnk1Pc9zoy9GdzmWAdM=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
