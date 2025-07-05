{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgramStable {
  pname = "ceashell";
  version = "2.0.2-unstable-2025-06-02";
  src = fetchFromGitHub {
    owner = "RoccoLoxPrograms";
    repo = "CEaShell";
    fetchSubmodules = true;
    rev = "1e0fa46835297b07cde59e968d5ddde0952c97de";
    hash = "sha256-OFsXNsz+Ikm41DSIdb8uxIvQGL+8kVdsKN4iJp8hrHw=";
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
