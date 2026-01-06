{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "hexaedit";
  version = "0-unstable-2024-05-29";
  src = fetchFromGitHub {
    owner = "captain-calc";
    repo = "HexaEdit-CE";
    rev = "d34b22afb1b8d52f8c6d7658f9bb10a4a9230cec";
    hash = "sha256-k4WvdFvxv7brAJ5mdrF+qECTyjATbARJJxddq+WlXl4=";
  };

  patches = [ ./binutils.patch ];

  meta = {
    description = "HexaEdit CE is a powerful on-calc hex editor for the TI-84 Plus CE.";
    license = with lib.licenses; [ bsd3 ];
  };
}
