{
  buildCEProgram,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgram {
  pname = "ceashell";
  version = "2.0.2-unstable-2025-12-23";
  src = fetchFromGitHub {
    owner = "RoccoLoxPrograms";
    repo = "CEaShell";
    fetchSubmodules = true;
    rev = "973e7af8bd987e4ac04341186549c63294769864";
    hash = "sha256-X8gAb6rSjj3Z7yZXHrknbsVbqBJ74OL3vuYqGPFw2MA=";
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
