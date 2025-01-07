{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "FlowCE";
  version = "0-unstable-2023-07-17";
  src = fetchFromGitHub {
    owner = "JonathanBush";
    repo = "FlowCE";
    rev = "c497cbb82d20dead9ff841476f19535e6ba8b134";
    hash = "sha256-+2qTFv5PzUG9EUMtd0sdIOe9fnC+3Q5yBG8NrK2RVMY=";
  };
  meta = {
    description = "Clone of Flow Free for the TI-84 Plus CE";
    license = with lib.licenses; [ gpl3Only ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
