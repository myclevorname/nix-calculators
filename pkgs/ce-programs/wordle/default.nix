{
  buildCEProgram,
  fetchFromGitHub,
  lib
}:
buildCEProgram {
  name = "wordle";
  src = fetchFromGitHub {
    owner = "commandblockguy";
    repo = "wordle";
    rev = "cab9c5e910f434b87ccc2df176e4ae63d1b93d0f";
    hash = "sha256-38fU6I8Ysgd4oZzmQWhyViAazcjLjMkJ+hhGAJkUpPM=";
  };
  buildPhase = ''
    runHook preBuild
    make gfx
    SELLOUT=1 make $makeFlags
    mv bin/WORDLE.8xp bin/WORDLE_sellout.8xp
    SELLOUT=0 make $makeFlags
    mv bin/WORDLE.8xp bin/WORDLE_classic.8xp
    runHook postBuild
  '';

  meta = {
    description = "Oiram is a mario-style platformer programmed from scratch in C and assembly using the CE development toolchain.";
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
