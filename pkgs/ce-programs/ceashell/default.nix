{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgramStable {
  pname = "ceashell";
  version = "2.0.2-unstable-2026-01-03";
  src = fetchFromGitHub {
    owner = "RoccoLoxPrograms";
    repo = "CEaShell";
    fetchSubmodules = true;
    rev = "b8eedee0b8d6b844ad7c7feabd99379270a70efd";
    hash = "sha256-8i8nmGjic56kyn5sFG5GnCjqj2ZC8aND2ys0H8n7Ix4=";
  };
  nativeBuildInputs = [
    python3
  ];
  meta = {
    homepage = "https://ceme.tech/t18820";
    description = "CEaShell (pronounced like \"Seashell\") is a new shell for the TI-84 Plus CE.";
    license = with lib.licenses; [ gpl3Only ];
  };
}
