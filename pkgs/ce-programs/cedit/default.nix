{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "CEdit";
  version = "release.1-unstable-2023-05-04";
  src = fetchFromGitHub {
    owner = "Michael0x18";
    repo = "CEdit";
    rev = "c501a20642bbf88cf6e766f3fe07c9449b7b8d94";
    hash = "sha256-K5a/CnaWeug8lWa7jEdoW3y6TwlVG5ADRUEPnpEKFws=";
  };
  postInstall = ''
    cp cedit.pdf $out
  '';
  meta = {
    homepage = "https://www.cemetech.net/forum/viewtopic.php?t=17772";
    description = "TI 84 plus CE text editor";
    license = with lib.licenses; [ ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
