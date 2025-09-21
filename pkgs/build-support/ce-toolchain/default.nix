{
  stdenv,
  fetchFromGitHub,
  convbin,
  convimg,
  fasmg,
  lib,
  llvm-ez80,
  convfont,
}:
stdenv.mkDerivation {
  pname = "ce-toolchain";
  version = "nightly-unstable-2025-09-21";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "toolchain";
    fetchSubmodules = true;
    rev = "af35bd7b48809bfbaf22c08681a3147b428b3bbb";
    hash = "sha256-rT8g9+Cn8PJhdIki2Tn3j4JzBMDkixHjn8nQ3Qz9CIw=";
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
