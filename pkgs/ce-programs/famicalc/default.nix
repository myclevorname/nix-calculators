{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-10-26";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "9ba8ba4aae495ee099b2c3201c726eda0c514c0f";
    hash = "sha256-tdCUU2QvCUKdeBjozY4yvtHQ3PM8BSXIzVacv8K+oOk=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
