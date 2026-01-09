{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgramStable {
  pname = "screensaver";
  version = "1.0-unstable-2026-01-08";
  src = fetchFromGitHub {
    owner = "EzCE";
    repo = "ScreenSaver-CE";
    rev = "ef0b0473aec777f27c3950f64734a22c351b419b";
    hash = "sha256-xi4pRm4fF1JQu3RyxLGkz7MNaInQZrytDMalz88cRnQ=";
  };
  nativeBuildInputs = [ python3 ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp app/bin/*.8x* README.md readme.txt LICENSE $out
    runHook postInstall
  '';
  meta = {
    description = "Run screensavers using APD";
    license = with lib.licenses; [ gpl3 ];
  };
}
