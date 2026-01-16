{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgramStable {
  pname = "screensaver";
  version = "1.0-unstable-2026-01-16";
  src = fetchFromGitHub {
    owner = "EzCE";
    repo = "ScreenSaver-CE";
    rev = "333207c2f484c726243b098c3d5372c185167826";
    hash = "sha256-FYj+Vfh2qKGbwaks3gGr/8blobWkwtO1o4/JIbj/nBo=";
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
