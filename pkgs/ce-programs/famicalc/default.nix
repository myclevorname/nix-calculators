{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "famicalc";
  version = "Pre-Release-unstable-2025-11-10";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "0b62b9371f6b2e4bcd75e19dd739013113bf4b34";
    hash = "sha256-d4EseIGLUkX37NI0z4HjP9/nRWyElSnbmOek9FsQWQk=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
