{ ce-toolchain, fetchFromGitHub }:
ce-toolchain.overrideAttrs {
  pname = "ce-toolchain";
  version = "14.0";
  patches = [ ./edit-makefiles.patch ];
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "toolchain";
    fetchSubmodules = true;
    rev = "decfb1b1848bc782b8deab846694e636951a2971";
    hash = "sha256-YNufixi27A+l042+CLJtYzYxHEXt73c6iv3m+XDht24=";
  };
  meta.broken = true;
}
