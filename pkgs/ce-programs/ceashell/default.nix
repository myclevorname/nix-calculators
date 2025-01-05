{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgramStable {
  pname = "ceashell";
  version = "2.0.2-unstable-2024-12-30";
  src = fetchFromGitHub {
    owner = "RoccoLoxPrograms";
    repo = "CEaShell";
    fetchSubmodules = true;
    rev = "87e2771ea73c5e27038867385b26e9028c643a90";
    hash = "sha256-CjBgxaQEcMzP8F5KHW2i24NrNCLQz9oCPaGg+XVmhPU=";
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
