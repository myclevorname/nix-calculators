{
  buildCEProgram,
  fetchFromGitHub,
  lib,
  spasm-ng,
}:
buildCEProgram {
  pname = "tiboyce";
  version = "0.3.1-unstable-2025-08-21";
  src = fetchFromGitHub {
    owner = "calc84maniac";
    repo = "tiboyce";
    rev = "97064a9816d7cc0744b9ab49eac97fed14f1fb8c";
    hash = "sha256-3r7glqATc+lIVR8dscDPckdr7HiDSZ4JxDkRsFt9MGA=";
  };

  nativeBuildInputs = [ spasm-ng ];
  buildPhase = ''
    bash ./build.sh
  '';

  meta = {
    description = "A Game Boy emulator for the TI-84 Plus CE and TI-83 Premium CE.";
    license = with lib.licenses; [ gpl3Only ];
  };
}
