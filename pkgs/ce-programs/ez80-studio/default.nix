{
  buildCEProgram,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgram {
  pname = "ez80-studio";
  version = "1.0-unstable-2024-12-30";
  src = fetchFromGitHub {
    owner = "EzCE";
    repo = "ez80-studio";
    rev = "9412c0fbdf3f6d08cef24027bb2f41bc19d5c942";
    hash = "sha256-m8n991nS5Qn3S+V2DF5v0yg3C/SZrTfVBqSwGlWp2a4=";
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
    maintainers = with lib.maintainers; [ clevor ];
  };
}
