{
  fasmg,
  stdenv,
  cmake,
  python3,
  lib,
  fetchFromGitHub,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "llvm-ez80";
  version = "nightly-unstable-2025-09-16";

  nativeBuildInputs = [
    cmake
    python3
  ];

  src = fetchFromGitHub {
    # owner = "jacobly0";
    owner = "CE-Programming";
    repo = "llvm-project";
    rev = "6593d865af3a45834bb7a0dda677f7cb2b7497ec";
    hash = "sha256-AjJ9H9uRDJHfOH3hYG4f7OmrnE1PHul3H8ItwGfoicQ=";
  };

  patchPhase = ''
    chmod +w --recursive /build/${finalAttrs.src.name}
  '';

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DLLVM_ENABLE_PROJECTS=clang"
    "-DLLVM_TARGETS_TO_BUILD="
    "-DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=Z80"
  ];
  buildFlags = [
    "llvm-link"
    "clang"
  ];

  sourceRoot = finalAttrs.src.name + "/llvm";

  doCheck = false;

  installPhase =
    let
      binDir = "/build/${finalAttrs.sourceRoot}/build/bin";
    in
    ''
      mkdir -p $out/bin
      cp ${binDir}/llvm-link $out/bin/ez80-link
      cp ${binDir}/clang $out/bin/ez80-clang
      ln -s $out/bin/ez80-link $out/bin/z80-link
      ln -s $out/bin/ez80-clang $out/bin/z80-clang
    '';

  meta = {
    description = "A compiler and linker for (e)Z80 targets.";
    longDescription = ''
      This package provides a compiler and linker for (e)Z80 targets
      based on the LLVM toolchain.
      Originally designed for the TI-84 Plus CE, this also works for the Agon Light.

      This does not provide fasmg or any include files to build the programs.
      Please install a toolchain, such as the CE C toolchain.
    '';
    homepage = "https://github.com/jacobly0/llvm-project";
    license = with lib.licenses; [
      asl20
      llvm-exception
    ];
    platforms = lib.platforms.unix;
  };
})
