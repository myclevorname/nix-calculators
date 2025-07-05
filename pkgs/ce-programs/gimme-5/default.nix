{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "gimme-5";
  version = "0-unstable-2024-05-29";
  src = fetchFromGitHub {
    owner = "captain-calc";
    repo = "Gimme-5";
    rev = "3e035a2d7a5a0248a704c51850264d70b3892513";
    hash = "sha256-r7zo5Tk1k5ft9Yg1ilgGylzL6cJS9BTts5OXQBUa89U=";
  };
  meta = {
    homepage = "https://www.cemetech.net/forum/viewtopic.php?t=18412";
    description = "A Wordle-inspired word guessing game for the TI-84 Plus CE";
    license = with lib.licenses; [ ];
  };
}
