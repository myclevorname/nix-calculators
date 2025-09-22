{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-09-22";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "a59cc1a492013a643995b875020407bca2b4f638";
    hash = "sha256-ZrGa1ObXxiAqH47sudhPAcHKeIjyTyrmKMksCEmwQas=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
