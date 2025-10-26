{
  buildCEProgram,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgram {
  pname = "ez80-studio";
  version = "1.0-unstable-2025-10-26";
  src = fetchFromGitHub {
    owner = "EzCE";
    repo = "ez80-studio";
    rev = "8cf851e5cb1807d6c60ece6dbcc62f15afd671c9";
    hash = "sha256-NFZRdxYtHMFThv598QadTG4LPExQBxpvArzVugOaI2Q=";
  };
  patchPhase = ''
    runHook prePatch
    patchShebangs includes/conv-inc.py
    runHook postPatch
  '';
  nativeBuildInputs = [ python3 ];
  postBuild = ''
    find includes -name "*.inc" ! -name "TI84PCEG_larger.inc" -exec bash -c "cd includes ; python3 conv-inc.py \$(basename {} .inc)" \;
  '';
  makeFlags = "final";
  meta = {
    description = "An on-calc eZ80 assembly IDE for the TI-84+ CE/83 PCE";
    license = with lib.licenses; [ gpl3 ];
  };
}
