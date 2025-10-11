{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-10-11";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "35673d34fb8a3d050f159bb42a3d966cd94a4237";
    hash = "sha256-cQIDZxu7S2WdSfdNBIzuO9VN4UMW+9uzrvOkjYaF63Y=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
