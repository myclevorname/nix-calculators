{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "midiCE";
  version = "1.0-unstable-2025-01-07";
  src = fetchFromGitHub {
    owner = "TIny-Hacker";
    repo = "midiCE";
    rev = "00435a8d9a39e49c00f1285d6f6ebc66e02031d7";
    hash = "sha256-qMAQr63m9KIe1/OcrTMApRXaMmXMWHENKzE1szv7Voc=";
  };
  meta = {
    description = "Use a TI-84 Plus CE as a USB MIDI keyboard / controller";
    license = with lib.licenses; [ gpl3Only ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
