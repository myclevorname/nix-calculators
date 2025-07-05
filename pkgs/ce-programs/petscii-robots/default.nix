{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "petscii-robots";
  version = "0-unstable-2025-05-22";
  src = fetchFromGitHub {
    owner = "nitinseshadri";
    repo = "ce-robots";
    rev = "5115ec8ab0db1b16bec420ccd011339a71c87462";
    hash = "sha256-/hM0nqBriZCWfrrwYLqcyhumTerXb1PkJtLw0sQJBHA=";
    fetchSubmodules = true;
  };
  meta = {
    description = "Port of Attack of the PETSCII Robots for the TI-84 Plus CE";
    license = with lib.licenses; [ unfree ];
  };
}
