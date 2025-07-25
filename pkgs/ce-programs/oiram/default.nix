{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "oiram";
  version = "0-unstable-2022-06-16";
  src = fetchFromGitHub {
    owner = "mateoconlechuga";
    repo = "oiram";
    rev = "ba2db485984ee4460e7320ab46ba5d009781786a";
    hash = "sha256-oXh9D+R3Rp1WCYykQm+r6C1MVNjSMwNaTqsh2Np3mkQ=";
  };
  meta = {
    description = "Oiram is a mario-style platformer programmed from scratch in C and assembly using the CE development toolchain.";
    license = with lib.licenses; [ bsd3 ];
  };
}
