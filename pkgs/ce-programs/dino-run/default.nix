{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "dino-run";
  version = "1.3-unstable-2023-06-12";
  src = fetchFromGitHub {
    owner = "commandblockguy";
    repo = "dino-run-ce";
    rev = "fb270ecd4034b42d66ff3270e39cb4c5e7dad5ca";
    hash = "sha256-eT3vG7xf7mrssNixBjEzVxXxQQsCARpxMUvFaN4D0xQ=";
    fetchSubmodules = true;
  };
  meta = {
    description = "A clone of Google Chrome's dinosaur game for the TI-84+CE";
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
