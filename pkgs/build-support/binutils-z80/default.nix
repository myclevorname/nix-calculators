{
  stdenv,
  fetchFromGitHub,
  texinfo,
  perl,
  bison,
  flex,
}:
stdenv.mkDerivation {
  pname = "binutils-z80";
  version = "nightly-unstable-2026-01-31";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "binutils-gdb";
    rev = "bdf0e52cab29cd946beb4f785330cbc35a98b9c2";
    hash = "sha256-3ZvgnU/etooW3o9497/LoMyJmMnWIEhMvBPIdBgrJfQ=";
  };
  enableParallelBuilding = true;
  configureFlags = [
    "--target=z80-none-elf"
    "--with-zstd=no"
    "--disable-gdb"
    "--disable-sim"
    "--disable-readline"
    "--disable-nls"
  ];
  installTargets = "install-strip";
  nativeBuildInputs = [
    texinfo
    perl
    bison
    flex
  ];
}
