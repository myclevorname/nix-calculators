{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "crossbun";
  version = "1.1-unstable-2025-11-02";
  src = fetchFromGitHub {
    owner = "commandblockguy";
    repo = "crossbun";
    rev = "4c37ea5ee3c96ef138a5cea74a55c75c1199f1b3";
    hash = "sha256-tDrkCg4Q1sUocQBvdpdG9A4TqaGJv0EbWS2BvPLwNhg=";
  };
  meta = {
    description = "Crossword program for the TI-84 Plus CE graphing calculator";
    license = with lib.licenses; [ mit ];
  };
}
