{ ce-toolchain, fetchFromGitHub }:
ce-toolchain.overrideAttrs {
  pname = "ce-toolchain";
  version = "12.1";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "toolchain";
    fetchSubmodules = true;
    rev = "decfb1b1848bc782b8deab846694e636951a2971";
    hash = "sha256-YNufixi27A+l042+CLJtYzYxHEXt73c6iv3m+XDht24=";
  };
}
