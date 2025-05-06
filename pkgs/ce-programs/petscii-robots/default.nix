{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "petscii-robots";
  version = "0-unstable-2025-04-26";
  src = fetchFromGitHub {
    owner = "nitinseshadri";
    repo = "ce-robots";
    rev = "7989fd88cab219173d22f8d762dff715d8ad0222";
    hash = "sha256-edlCrOB/ygDloVnhtrXxOJH2QBSDut8TLu2uYsDeuAs=";
    fetchSubmodules = true;
  };
  meta = {
    description = "Port of Attack of the PETSCII Robots for the TI-84 Plus CE";
    license = with lib.licenses; [ unfree ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
