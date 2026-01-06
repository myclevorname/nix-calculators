{ stdenv, fetchFromGitHub, texinfo, perl, bison, flex }:
stdenv.mkDerivation {
  pname = "binutils-z80";
  version = "nightly-unstable-2026-01-04";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "binutils-gdb";
    rev = "9dd36550c3576effb49470c85e85a7ffe4793d3e";
    hash = "sha256-z/gH7MjFqxf5mG3wJZqExK55P93My2jDBO4JlcNz8IM=";
  };
  enableParallelBuilding = true;
  configureFlags = [ "--target=z80-none-elf" "--with-zstd=no" "--disable-gdb" "--disable-sim" "--disable-readline" "--disable-nls" ];
  installTargets = "install-strip";
  nativeBuildInputs = [ texinfo perl bison flex ];
}
