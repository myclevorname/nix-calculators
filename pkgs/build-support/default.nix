pkgs:
let
  inherit (pkgs) callPackage;
in
{
  convbin = callPackage ./convbin { };
  convimg = callPackage ./convimg { };
  convfont = callPackage ./convfont { };
  llvm-ez80 = callPackage ./llvm-ez80 { };
  ce-toolchain = callPackage ./ce-toolchain { };
  ce-toolchain-stable = callPackage ./ce-toolchain-stable { };
  buildCEProgram = callPackage ./buildCEProgram { };
  buildCEProgramStable = callPackage ./buildCEProgram {
    ce-toolchain = pkgs.ce-toolchain-stable;
  };
  ce-libs = callPackage ./ce-libs { };
  ce-libs-stable = callPackage ./ce-libs { ce-toolchain = pkgs.ce-toolchain-stable; };
  buildTIBoyCEROM = callPackage ./buildTIBoyCEROM { tiboyce = pkgs.CEPrograms.tiboyce; };
}
