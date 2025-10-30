{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-10-29";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "58e720e1ad7c05952cde8bce720c4c108a16ebba";
    hash = "sha256-tv9xAPyBvvgAurFOGt7Wu3QM9QyuBL4LGICxOjArg9Q=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
