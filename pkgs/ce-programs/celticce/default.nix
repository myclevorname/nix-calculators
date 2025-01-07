{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "CelticCE";
  version = "1.0.1-unstable-2024-12-28";
  src = fetchFromGitHub {
    owner = "RoccoLoxPrograms";
    repo = "CelticCE";
    rev = "b317ac22c648cb3d215d168d81f1ea64ee2c8318";
    hash = "sha256-SSw/xpKgA0wWSaMfbm50061kGZqk8sVzXGdXomrYSBU=";
  };
  postInstall = ''
    cp CelticCE.pdf cheatsheet.txt COMMANDS.md $out
  '';
  meta = {
    description = "Celtic Hybrid BASIC library for the TI-84 Plus CE";
    license = with lib.licenses; [ bsd3 ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
