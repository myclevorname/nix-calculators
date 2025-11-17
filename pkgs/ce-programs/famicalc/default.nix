{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "Pre-Release-unstable-2025-11-16";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "25cfa4cecb4bf4b5d282be3c86d4ebfb9d6d0ce1";
    hash = "sha256-6mVD5DVZlP7YCYE1Gzj2Y57kx7OXtyNY/lbA/+N8uxY=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
