{ stdenv, fetchFromGitHub, convbin, convimg, fasmg, lib, llvm-ez80, convfont }:
stdenv.mkDerivation {
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "toolchain";
    fetchSubmodules = true;
    rev = "ece00f47e75a74de3d2846589ae48ce19be221f3";
    hash = "sha256-GWulPYZ1rCI5hjEw6hV028Cx0zws5aGSC0tw9kUuHOc=";
  };
  name = "ce-toolchain";
  patchPhase = ''
    substituteInPlace src/common.mk --replace-fail \
      "INSTALL_DIR := \$(DESTDIR)\$(PREFIX)" "INSTALL_DIR := $out"
    substituteInPlace makefile --replace-fail \
      "TOOLS := fasmg convbin convimg convfont cedev-config" \
      "TOOLS := fasmg cedev-config" --replace-fail \
      "	\$(Q)\$(call COPY,\$(call NATIVEEXE,tools/convfont/convfont),\$(INSTALL_BIN))
    	\$(Q)\$(call COPY,\$(call NATIVEEXE,tools/convimg/bin/convimg),\$(INSTALL_BIN))
    	\$(Q)\$(call COPY,\$(call NATIVEEXE,tools/convbin/bin/convbin),\$(INSTALL_BIN))" "" \
      --replace-fail "tools/convbin/bin/" ""
    substituteInPlace tools/convimg/Makefile tools/cedev-config/Makefile \
      --replace-fail "-static" ""
    substituteInPlace src/makefile.mk \
      --replace-fail "\$(call NATIVEPATH,\$(BIN)/fasmg)" "${fasmg}/bin/fasmg" \
      --replace-fail "\$(call NATIVEPATH,\$(BIN)/convbin)" "${convbin}/bin/convbin" \
      --replace-fail "\$(call NATIVEPATH,\$(BIN)/convimg)" "${convimg}/bin/convimg" \
      --replace-fail "\$(call NATIVEPATH,\$(BIN)/cemu-autotester)" "cemu-autotester" \
      --replace-fail "\$(call NATIVEPATH,\$(BIN)/ez80-clang)" "${llvm-ez80}/bin/ez80-clang" \
      --replace-fail "\$(call NATIVEPATH,\$(BIN)/ez80-link)" "${llvm-ez80}/bin/ez80-link" \
      --replace-fail "CONVBINFLAGS += -b \$(call QUOTE_ARG,\$(COMMENT))" ""
  '';
  doCheck = true;
  enableParallelBuilding = true;

  buildInputs = [ convimg convfont llvm-ez80 fasmg convbin ];
  meta = {
    description = "Toolchain and libraries for C/C++ programming on the TI-84+ CE calculator series ";
    maintainers = with lib.maintainers; [ clevor ];
    mainProgram = "cedev-config";
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
  };
}
