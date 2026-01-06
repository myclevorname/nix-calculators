{
  buildCEProgram,
  fetchFromGitLab,
  lib,
}:
buildCEProgram {
  pname = "WEB1999";
  version = "0.1c-unstable-2023-12-31";
  src = fetchFromGitLab {
    owner = "taricorp";
    repo = "web1999";
    rev = "5c8b7c14f86c3584808d432bdd43b943db78c34f";
    hash = "sha256-lZy0EU7Rno5UhW4NG84ZGNm3Mst7VWpfchJLHoFc990=";
  };
  meta = {
    broken = true;
    description = "a simulation of the Web browsing experience circa the turn of the third millennium";
    license = with lib.licenses; [
      cc-by-nc-30 # and
      bsd2
    ];
  };
}
