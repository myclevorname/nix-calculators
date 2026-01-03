{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "midiCE";
  version = "1.0-unstable-2026-01-03";
  src = fetchFromGitHub {
    owner = "TIny-Hacker";
    repo = "midiCE";
    rev = "563afe71ce4423bfc20af1f25ffaee03d60dce2c";
    hash = "sha256-uxfzh6xieou4UtLfmf1g3qtjiH2ckTCUA9/pbSKlJLk=";
  };
  meta = {
    broken = true;
    description = "Use a TI-84 Plus CE as a USB MIDI keyboard / controller";
    license = with lib.licenses; [ lgpl3Only ];
  };
}
