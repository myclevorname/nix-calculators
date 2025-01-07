pkgs:
let
  inherit (pkgs) callPackage python3Packages;
in
{
  convbin = callPackage ./convbin { };
  convimg = callPackage ./convimg { };
  convfont = callPackage ./convfont { };
  llvm-ez80 = callPackage ./llvm-ez80 { };
  gcc4ti = callPackage ./gcc4ti { };
  ce-toolchain = callPackage ./ce-toolchain { };
  ce-toolchain-stable = callPackage ./ce-toolchain-stable { };
  buildCEProgram = callPackage ./buildCEProgram { };
  buildCEProgramStable = callPackage ./buildCEProgram {
    ce-toolchain = pkgs.ce-toolchain-stable;
  };
  buildCrossbunPack = callPackage ./buildCrossbunPack { };
  buildTIBoyCEROM = callPackage ./buildTIBoyCEROM { tiboyce = pkgs.CEPrograms.tiboyce; };
  ce-libs = callPackage ./ce-libs { };
  ce-libs-stable = callPackage ./ce-libs { ce-toolchain = pkgs.ce-toolchain-stable; };
  puzpy = python3Packages.callPackage ./puzpy { };
  tivars = python3Packages.callPackage ./tivars { };
}
