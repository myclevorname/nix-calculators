{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgramStable {
  pname = "screensaver";
  version = "1.0-unstable-2026-01-11";
  src = fetchFromGitHub {
    owner = "EzCE";
    repo = "ScreenSaver-CE";
    rev = "720fbc4c93d741b926b6dccf4fc4157d7575d6da";
    hash = "sha256-2mr0Z27CwRblGYKUHLC49f4q4AGZQo4YkPemxpfq1cg=";
  };
  nativeBuildInputs = [ python3 ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp app/bin/*.8x* README.md readme.txt LICENSE $out
    runHook postInstall
  '';
  meta = {
    broken = true;
    description = "Run screensavers using APD";
    license = with lib.licenses; [ gpl3 ];
  };
}
