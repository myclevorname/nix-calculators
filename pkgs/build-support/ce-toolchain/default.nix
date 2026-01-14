{
  stdenv,
  fetchFromGitHub,
  convbin,
  convimg,
  fasmg,
  lib,
  llvm-ez80,
  convfont,
  binutils-z80,
}:
stdenv.mkDerivation {
  pname = "ce-toolchain";
  version = "14.2-unstable-2026-01-13";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "toolchain";
    fetchSubmodules = true;
    rev = "87cd46d471dee9d5ee6f656e45f8746af734591f";
    hash = "sha256-9K8FQKEQfkWCFVmpjNTZz66Al8c1sPYEWrBdsnggAmM=";
  };
  patches = [ ./edit-makefiles.patch ];
  postPatch = ''
    mkdir -p $out/bin
    ln -s ${convbin}/bin/convbin $out/bin
    ln -s ${convimg}/bin/convimg $out/bin
    ln -s ${convfont}/bin/convfont $out/bin
    ln -s ${llvm-ez80}/bin/ez80-link $out/bin
    ln -s ${llvm-ez80}/bin/ez80-clang $out/bin
    ln -s ${fasmg}/bin/fasmg $out/bin
    ln -s ${binutils-z80} $out/binutils
    substituteAllInPlace makefile
    substituteAllInPlace src/common.mk
    substituteAllInPlace src/makefile.mk
  '';
  enableParallelBuilding = true;

  buildInputs = [
    convimg
    convfont
    llvm-ez80
    fasmg
    convbin
    binutils-z80
  ];
  meta = {
    description = "Toolchain and libraries for C/C++ programming on the TI-84+ CE calculator series";
    license = with lib.licenses; [ lgpl3 ];
    mainProgram = "cedev-config";
    platforms = [
      "x86_64-linux"
      "x86_64-darwin"
    ];
  };
}
