{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "midiCE";
  version = "1.0-unstable-2025-01-02";
  src = fetchFromGitHub {
    owner = "TIny-Hacker";
    repo = "midiCE";
    rev = "a76b0af16b96223225d552292ee3da2b1cb2c805";
    hash = "sha256-+ZBsXnuuNfmhSrpyv5ATMG3s5K61LAivq41R7QONqsQ=";
  };
  meta = {
    description = "Use a TI-84 Plus CE as a USB MIDI keyboard / controller";
    license = with lib.licenses; [ gpl3Only ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
