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
  version = "nightly-unstable-2025-03-26";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "toolchain";
    fetchSubmodules = true;
    rev = "8f1ca3f6e6c208280c1afebba3ee4368645b7016";
    hash = "sha256-sRefoiHQWKlGLrMcgeiPpVY2YtWOhehJVm9X29Hwz3o=";
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
    description = "Toolchain and libraries for C/C++ programming on the TI-84+ CE calculator series ";
    maintainers = with lib.maintainers; [ clevor ];
    mainProgram = "cedev-config";
    platforms = [
      "x86_64-linux"
      "x86_64-darwin"
    ];
  };
}
