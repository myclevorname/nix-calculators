{
  buildCEProgram,
  fetchFromGitHub,
  lib
}:
buildCEProgram {
  name = "famicalc";
  src = fetchFromGitHub {
    owner = "Zaalan3";
    repo = "Famicalc";
    rev = "c3f2e56275c248a1db98ca7f650d18c0a116bf7f";
    hash = "sha256-4efDQqzEn/zq4RVX+aBaVE/WVs+VVulLbuJPnE54kNQ=";
  };
  meta = {
    description = "WIP NES emulator for the TI84+CE";
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
