{
  buildCEProgram,
  fetchFromGitHub,
  lib
}:
buildCEProgram {
  name = "Blocks";
  src = fetchFromGitHub {
    owner = "TheScienceElf";
    repo = "Blocks-TI-84";
    rev = "b515543c69a72ab995a31461a96dc93e6039261b";
    hash = "sha256-41mPIA98jo+fxDdydQqvRVaxZiD4/TVjOzVb0c6EqyA=";
  };
  patchPhase = ''
    runHook prePatch
    rm -rf bin
    runHook postPatch
  '';

  postInstall = ''
    cp Screenshot.png $out
  '';
  meta = {
    homepage = "https://github.com/TheScienceElf/Blocks-TI-84";
    description = "A Minecraft-esque game for the TI 84 CE calculator.";
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
