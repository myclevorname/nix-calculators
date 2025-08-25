{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-08-25";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "d8e2c65facd19f0eb0d9faf2b6af8fc0714db31d";
    hash = "sha256-EL5JYQnSfBbQxz5O7qMZnaUHyZnKtLafKgPhhx7O790=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
