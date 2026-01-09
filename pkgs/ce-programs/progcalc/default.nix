{
  buildCEProgramStable,
  fetchFromGitHub,
  lib,
}:
buildCEProgramStable {
  pname = "progcalc";
  version = "20210812-4-unstable-2021-08-13";
  src = fetchFromGitHub {
    owner = "drdnar";
    repo = "progcalc";
    rev = "d3f6b8b6e5a68a0f3146edda59c27e238f0205b8";
    hash = "sha256-7w7k7sj8HSQIgjJQI1rjJ0VOziwE16XMlW6rAsZAEes=";
  };
  meta = {
    description = "Programmer's Calculator for the TI-84 Plus CE";
    license = with lib.licenses; [ gpl3Only ];
  };
}
