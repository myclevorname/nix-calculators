{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "screensaver";
  version = "1.0-unstable-2026-01-03";
  src = fetchFromGitHub {
    owner = "EzCE";
    repo = "ScreenSaver-CE";
    rev = "05f5056a8da85765f2b70434a1c690ee1e22ffc4";
    hash = "sha256-/wNCsDIXvYke1vgnCdLXFSVkAUy+uhAGNvJzgJlIr4M=";
  };
  meta = {
    broken = true;
    description = "Run screensavers using APD";
    license = with lib.licenses; [ gpl3 ];
  };
}
