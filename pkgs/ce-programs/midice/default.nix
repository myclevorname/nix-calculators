{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "midiCE";
  version = "1.0-unstable-2025-02-05";
  src = fetchFromGitHub {
    owner = "TIny-Hacker";
    repo = "midiCE";
    rev = "d4406a474f160b8535cdf6537cc901a5e6763c7d";
    hash = "sha256-uZrkBYLxRR5+tBfVXnGQwX3NzdZ9RiuNg9t/fyJ0P1s=";
  };
  meta = {
    description = "Use a TI-84 Plus CE as a USB MIDI keyboard / controller";
    license = with lib.licenses; [ lgpl3Only ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
