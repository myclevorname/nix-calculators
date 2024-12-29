{
  buildCEProgram,
  fetchFromGitHub,
  lib
}:
buildCEProgram {
  name = "dinopuzz";
  src = fetchFromGitHub {
    owner = "merthsoft";
    repo = "dinopuzz-84-ce";
    rev = "80342ab890cacf2b7f6fbf88eb0372f81698d673";
    hash = "sha256-AijJWF2aRTjlUsI1qPqBvtavY/qflyB5wOAm5baJ+H0=";
  };
  postInstall = ''
    cp liscence.txt $out/LICENSE
  '';
  meta = {
    homepage = "https://github.com/merthsoft/dinopuzz-84-ce";
    description = "Dino Puzzle for the 84+CE";
    license = with lib.licenses; [ wtfpl ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
