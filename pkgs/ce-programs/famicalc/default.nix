{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
}:
buildCEProgramStable {
  pname = "famicalc";
  version = "Pre-Release-unstable-2026-01-23";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "c18026bb6b6f127c9fcbd00f1d7afcb431041ae9";
    hash = "sha256-IiY0qFNmtcMpoLu9rxJUA9Xhu3tjpB5B+88B/qM1Xd8=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
  };
}
