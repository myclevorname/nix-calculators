{ callPackage, packages }:
with packages; rec {
  convbin = callPackage ./convbin {};
  llvm-ez80 = callPackage ./llvm-ez80 {};
  ce-toolchain = callPackage ./ce-toolchain { inherit convbin llvm-ez80; };
  buildCEProgram = callPackage ./buildCEProgram { inherit convbin llvm-ez80 ce-toolchain; };
  ce-libs = callPackage ./ce-libs { inherit ce-toolchain; };
  buildTIBoyCEROM = callPackage ./buildTIBoyCEROM { tiboyce = packages.CEPrograms.tiboyce; };
}
