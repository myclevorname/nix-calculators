{
  buildCEProgram,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgram {
  pname = "ez80-studio";
  version = "1.0-unstable-2025-09-15";
  src = fetchFromGitHub {
    owner = "EzCE";
    repo = "ez80-studio";
    rev = "d271b0bed6ccdbeff91486e0c8b8b2bcc766e219";
    hash = "sha256-N//ZqIlqZJm7kV3FoBmDJOarpQvXx7BFa7CHOKAyIhM=";
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
