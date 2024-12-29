{
  buildCEProgram,
  fetchFromGitHub,
  lib,
  python3
}:
buildCEProgram {
  name = "ez80-studio";
  patchPhase = ''
    runHook prePatch
    patchShebangs includes/conv-inc.py
    runHook postPatch
  '';

  src = fetchFromGitHub {
    owner = "EzCE";
    repo = "ez80-studio";
    rev = "a8e46f34a8733ed08027fa0f6f2aba8dce455c9b";
    hash = "sha256-XCxDmYsFSs1UAHfs7Hnt98rsDM5E9lB2vWabuzuLjgg=";
  };
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
