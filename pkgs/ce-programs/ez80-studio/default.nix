{
  buildCEProgram,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgram {
  pname = "ez80-studio";
  version = "1.0-unstable-2025-01-17";
  src = fetchFromGitHub {
    owner = "EzCE";
    repo = "ez80-studio";
    rev = "696ab64686556988f541019eb07b9a08b7432cce";
    hash = "sha256-NnKZUrQyIZEtcENsfZfnhynMpmDek0Mt1ZMjI2Oa9zg=";
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
