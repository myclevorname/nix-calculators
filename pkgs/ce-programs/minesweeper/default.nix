{
  buildCEProgram,
  fetchFromGitHub,
  lib
}:
buildCEProgram {
  name = "minesweeper";
  src = fetchFromGitHub {
    owner = "merthsoft";
    repo = "minesweeper-84-ce";
    rev = "253a6045973c629312986ceb76b7767b283143f5";
    hash = "sha256-nKV/2jwgA+/E5cOuXTDlSzoKdqP30RRUwM3QxxM7WCU=";
  };
  meta = {
    description = "Minesweeper for the TI-84+CE.";
    license = with lib.licenses; [ unlicense ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
