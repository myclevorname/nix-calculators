{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
  python3
}:
buildCEProgramStable {
  name = "ceashell";
  src = fetchFromGitHub {
    owner = "RoccoLoxPrograms";
    repo = "CEaShell";
    fetchSubmodules = true;
    rev = "12a1b03a84f15de312558d712bb2cb64570aa880";
    hash = "sha256-1xysRuoILO9D3mCikRLD5LaLQxj9PUnrngJUJBBIAD4=";
  };

  nativeBuildInputs = [
    python3
  ];
  meta = {
    homepage = "https://ceme.tech/t18820";
    description = "CEaShell (pronounced like \"Seashell\") is a new shell for the TI-84 Plus CE.";
    license = with lib.licenses; [ gpl3Only ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
