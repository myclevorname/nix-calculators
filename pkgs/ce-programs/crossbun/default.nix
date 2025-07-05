{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "crossbun";
  version = "1.0-unstable-2025-01-06";
  src = fetchFromGitHub {
    owner = "commandblockguy";
    repo = "crossbun";
    rev = "56e88eb188c026a58d58e4891cfc195a28e61a62";
    hash = "sha256-IpsE/ilm6d97uL7Zy92Qbl0dv4LM4ekcm3pp3uXJcBU=";
  };
  meta = {
    description = "Crossword program for the TI-84 Plus CE graphing calculator";
    license = with lib.licenses; [ mit ];
  };
}
