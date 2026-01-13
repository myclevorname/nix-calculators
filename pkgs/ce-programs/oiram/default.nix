{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "oiram";
  version = "0-unstable-2026-01-13";
  src = fetchFromGitHub {
    owner = "mateoconlechuga";
    repo = "oiram";
    rev = "85d124f394c23d4ee0f5fd0235aef6275879c7b9";
    hash = "sha256-RCPrtmhb/+1oIsiQbxoaP8F0dB9ZRBRZcb4k7BkpnQQ=";
  };
  meta = {
    description = "Oiram is a mario-style platformer programmed from scratch in C and assembly using the CE development toolchain.";
    license = with lib.licenses; [ bsd3 ];
  };
}
