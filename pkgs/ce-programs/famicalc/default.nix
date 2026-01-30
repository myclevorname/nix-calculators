{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
}:
buildCEProgramStable {
  pname = "famicalc";
  version = "Pre-Release-unstable-2026-01-29";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "ee9b69f78ce5f5666a70382869b705d390a3f0b8";
    hash = "sha256-Umn/upNTXI9TumBG3yY7uxK4yUCc2EFdFldWzWxJsBc=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
