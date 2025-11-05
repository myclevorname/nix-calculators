{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgramStable {
  pname = "ceashell";
  version = "2.0.2-unstable-2025-11-03";
  src = fetchFromGitHub {
    owner = "RoccoLoxPrograms";
    repo = "CEaShell";
    fetchSubmodules = true;
    rev = "fae90006b7540cda415a4f04bef90285072e08ce";
    hash = "sha256-MietApzqH1q25me81YWE/BthkFEt9gKkrxbH/PAgYyY=";
  };
  nativeBuildInputs = [
    python3
  ];
  meta = {
    homepage = "https://ceme.tech/t18820";
    description = "CEaShell (pronounced like \"Seashell\") is a new shell for the TI-84 Plus CE.";
    license = with lib.licenses; [ gpl3Only ];
    broken = true;
  };
}
