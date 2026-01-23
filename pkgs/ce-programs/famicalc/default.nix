{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
}:
buildCEProgramStable {
  pname = "famicalc";
  version = "Pre-Release-unstable-2026-01-22";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "8626bc477fdb05fa8bb05fa12394da33af35eede";
    hash = "sha256-5fecO/4Gjw3/O/7n0i2DM0CXtVbR/9LNBHb5+jLoHSQ=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
