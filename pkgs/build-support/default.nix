{ callPackage, packages }:
with packages;
rec {
  convbin = callPackage ./convbin { };
  llvm-ez80 = callPackage ./llvm-ez80 { };
  ce-toolchain = callPackage ./ce-toolchain { inherit convbin llvm-ez80; };
  ce-toolchain-stable = callPackage ./ce-toolchain-stable { inherit ce-toolchain; };
  buildCEProgram = callPackage ./buildCEProgram { inherit convbin llvm-ez80 ce-toolchain; };
  buildCEProgramStable = callPackage ./buildCEProgram {
    inherit convbin llvm-ez80;
    ce-toolchain = ce-toolchain-stable;
  };
  ce-libs = callPackage ./ce-libs { inherit ce-toolchain; };
  ce-libs-stable = callPackage ./ce-libs { ce-toolchain = ce-toolchain-stable; };
  buildTIBoyCEROM = callPackage ./buildTIBoyCEROM { tiboyce = packages.CEPrograms.tiboyce; };
}
