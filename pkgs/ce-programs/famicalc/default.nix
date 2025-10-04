{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "0-unstable-2025-10-04";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "11c46b751784995fb5924a57fa5de6de692c5970";
    hash = "sha256-lwiFMgVvHz4OUgluoO2TEG8bD7yHwuopLDkvQmEfJKg=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
