{
  buildCEProgram,
  fetchFromGitHub,
  lib,
  python3,
}:
buildCEProgram {
  pname = "ez80-studio";
  version = "1.0-unstable-2025-01-10";
  src = fetchFromGitHub {
    owner = "EzCE";
    repo = "ez80-studio";
    rev = "e0b45c03aab41351f4cc6da053be0988c36810ac";
    hash = "sha256-aqwuCi9jzlCvSVF2lrEfFDza05Z+ix7GLehsLnGQUb8=";
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
