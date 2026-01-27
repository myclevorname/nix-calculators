{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgramStable {
  pname = "screensaver";
  version = "1.0-unstable-2026-01-26";
  src = fetchFromGitHub {
    owner = "EzCE";
    repo = "ScreenSaver-CE";
    rev = "ceaaf41874ac69f234e32d41c1c1af4ed0c25547";
    hash = "sha256-fcJAgdIGWD7v02PDW1MPCYuONxCRCKeiROewlJJeNjk=";
  };
  nativeBuildInputs = [ python3 ];
  preInstall = ''
    rm $(find -name output.8xp)
  '';
  meta = {
    description = "Run screensavers using APD";
    license = with lib.licenses; [ gpl3 ];
  };
}
