{ callPackage, packages }:
with packages; rec {
  fasmg = callPackage ./fasmg {};
  convbin = callPackage ./convbin {};
  llvm-ez80 = callPackage ./llvm-ez80 { inherit fasmg; };
  ce-toolchain = callPackage ./ce-toolchain { inherit fasmg convbin llvm-ez80; };
  buildCEProgram = callPackage ./buildCEProgram { inherit fasmg convbin llvm-ez80 ce-toolchain; };
  ce-libs = callPackage ./ce-libs { inherit ce-toolchain; };
  buildTIBoyCEROM = callPackage ./buildTIBoyCEROM { tiboyce = packages.CEPrograms.tiboyce; };
}
