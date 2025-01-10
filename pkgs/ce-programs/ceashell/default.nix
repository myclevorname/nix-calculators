{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgramStable {
  pname = "ceashell";
  version = "2.0.2-unstable-2025-01-10";
  src = fetchFromGitHub {
    owner = "RoccoLoxPrograms";
    repo = "CEaShell";
    fetchSubmodules = true;
    rev = "faca8310419837ef906b7e982a3f64a63c141df8";
    hash = "sha256-njN10rb/paEQrKnhDihl1u+sl9EJsgWmkYT6+IPc0zE=";
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
