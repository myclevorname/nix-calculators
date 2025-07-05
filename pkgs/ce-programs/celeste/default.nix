{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "CEleste";
  version = "1.2-unstable-2023-01-21";
  src = fetchFromGitHub {
    owner = "commandblockguy";
    repo = "CEleste";
    rev = "3a8f6627481af6aac20ca4d97301e4beffadff6a";
    hash = "sha256-UKoXTYRmBxwuO+4JRGtVqlEZuvS3FDqHftQE2nolCrY=";
  };
  meta = {
    description = "Celeste Classic port for the TI-84+CE and TI-83PCE graphing calculators";
    license = with lib.licenses; [ mit ];
  };
}
