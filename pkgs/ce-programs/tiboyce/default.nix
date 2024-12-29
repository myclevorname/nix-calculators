{
  buildCEProgram,
  fetchFromGitHub,
  lib,
  spasm-ng
}:
buildCEProgram {
  name = "tiboyce";
  src = fetchFromGitHub {
    owner = "calc84maniac";
    repo = "tiboyce";
    rev = "88cdf31fd8a732ea1fecccd60c9e621b82c23ac7";
    hash = "sha256-jXrIqVZzfUl91YKUIGCycCQQ+r8fXIArqD0eLpganq0=";
  };

  nativeBuildInputs = [ spasm-ng ];
  buildPhase = ''
    bash ./build.sh
  '';

  meta = {
    description = "A Game Boy emulator for the TI-84 Plus CE and TI-83 Premium CE.";
    license = with lib.licenses; [ gpl3Only ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
